// Package controllers est responsable de la gestion des controllers de l'application
package controllers

import (
	"context"
	"os"

	"github.com/dgrijalva/jwt-go"
	"golang.org/x/crypto/bcrypt"
	"net/http"
	"time"

	// Importer le package models qui définit la structure des utilisateurs
	"projet-mobile-backend-go/models"

	// Importer le package de base de données
	"projet-mobile-backend-go/database"

	// Importer le package gin qui est un cadre pour écrire des applications en Go
	"github.com/gin-gonic/gin"
)

// SignupHandler sera appelée chaque fois qu'une requête POST est effectuée sur l'URL /signup.
// Elle prend en paramètre un objet gin.Context qui contient toutes les informations sur la requête HTTP,
// y compris les paramètres, le corps de la requête, les headers, etc...
func SignupHandler(c *gin.Context) {

	// Déclarer "user" du type "models.User" qui est la structure utilisateur
	var user models.User

	// Lier ou "parser" le corps JSON de la requête HTTP à la structure user.
	// Si le corps de la requête contient un JSON valide qui correspond à la structure models.User, alors "user" sera
	// rempli avec ces données.
	if err := c.ShouldBindJSON(&user); err != nil {

		// Sinon ShouldBindJSON renverra une erreur (c'est-à-dire que le JSON était absent ou mal formé),
		// alors le code répondra à la requête avec un statut HTTP 400 et un message d'erreur.
		c.JSON(400, gin.H{"error": "Failed to parse request"})
		return
	}

	// Ajouter la logique pour sauvegarder user dans la db.

	// Quand un utilisateur s'inscrit, on doit hasher son mot de passe avant de le sauvegarder dans la BDD
	// en utilisant bcrypt
	hashedPassword, err := bcrypt.GenerateFromPassword([]byte(user.Password), bcrypt.DefaultCost)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to hash password"})
		return
	}
	user.Password = string(hashedPassword)

	// Après avoir hashé le mot de passe, on sauvegarde l'utilisateur dans la BDD
	collection := database.Client.Database("myAppMHP").Collection("users")
	_, err = collection.InsertOne(context.TODO(), user)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Failed to sign up the user"})
		return
	}

	// Si c'est "OK" on renvoie une réponse HTTP avec un statut 200 et un message JSON que l'utilisateur est inscrit
	c.JSON(200, gin.H{"message": "User was registered successfully"})
}

// LoginHandler sera appelée chaque fois qu'une requête POST est effectuée sur l'URL /login.
func LoginHandler(c *gin.Context) {
	var user models.User
	if err := c.ShouldBindJSON(&user); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": "Invalid request payload"})
		return
	}

	// Chercher l'utilisateur dans la base de données par son email
	foundUser, err := database.FindUserByEmail(user.Email)

	if foundUser == nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "User not found"})
		return
	}

	if err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Incorrect email or password"})
		return
	}

	// Vérifier que le mot de passe est correct
	if err := bcrypt.CompareHashAndPassword([]byte(foundUser.Password), []byte(user.Password)); err != nil {
		c.JSON(http.StatusUnauthorized, gin.H{"error": "Incorrect email or password"})
		return
	}

	// Générer le JWT
	token, err := generateToken(*foundUser)
	if err != nil {
		c.JSON(http.StatusInternalServerError, gin.H{"error": "Could not generate token"})
		return
	}

	c.JSON(http.StatusOK, gin.H{"token": token})
}

func generateToken(user models.User) (string, error) {
	var jwtKey = []byte(os.Getenv("SECRET_KEY"))

	// Créez un token avec une date d'expiration
	expirationTime := time.Now().Add(24 * time.Hour)
	claims := &jwt.StandardClaims{
		Subject:   user.ID,
		ExpiresAt: expirationTime.Unix(),
	}

	token := jwt.NewWithClaims(jwt.SigningMethodHS256, claims)
	return token.SignedString(jwtKey)
}

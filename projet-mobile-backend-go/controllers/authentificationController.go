// Package controllers est responsable de la gestion des controllers de l'application
package controllers

import (
	// Importer le package models qui définit la structure des utilisateurs
	"projet-mobile-backend-go/models"

	// Importer le package gin, un cadre très populaire pour écrire des applications en Go
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

	// Si c'est "OK" on renvoie une réponse HTTP avec un statut 200 et un message JSON que l'utilisateur est inscrit
	c.JSON(200, gin.H{"message": "User signed up successfully"})
}

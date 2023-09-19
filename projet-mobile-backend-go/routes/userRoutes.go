// Package routes est responsable de la gestion des routes de l'application
package routes

import (

	// Importer le package models qui définit la structure des utilisateurs
	"projet-mobile-backend-go/controllers"
	// Importer le package gin, un cadre très populaire pour écrire des applications en Go
	"github.com/gin-gonic/gin"
)

// RegisterRoutes prend en argument une référence à un objet "gin.Engine" (le moteur principal de l'application)
func RegisterRoutes() *gin.Engine {

	route := gin.Default()

	// Endpoint pour l'inscription (signup)
	// Elle définit une route POST pour l'URL /signup qui, lorsqu'elle est appelée, exécutera la fonction signupHandler
	route.POST("/signup", controllers.SignupHandler)

	// Endpoint pour la connexion (login)
	route.POST("/login", controllers.LoginHandler)

	// Endpoint pour la déconnexion (logout)
	//route.POST("/logout", controllers.LogoutHandler)

	// Ajout du nouvel endpoint pour la racine "/"
	route.GET("/", func(c *gin.Context) {
		c.String(200, "Bienvenue sur mon API!")
	})

	return route
}

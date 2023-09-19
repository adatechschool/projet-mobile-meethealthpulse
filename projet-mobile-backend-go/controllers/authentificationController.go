// Package controllers est responsable de la gestion des controllers de l'application
package controllers

import (

	// Importer le package gin, un cadre très populaire pour écrire des applications en Go
	"github.com/gin-gonic/gin"
)

// SignupHandler sera appelée chaque fois qu'une requête POST est effectuée sur l'URL /signup.
// Elle prend en paramètre un objet gin.Context qui contient toutes les informations sur la requête HTTP,
// y compris les paramètres, le corps de la requête, les headers, etc...
func SignupHandler(c *gin.Context) {

}

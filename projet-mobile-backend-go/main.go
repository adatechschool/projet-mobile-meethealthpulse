// On déclare que le fichier appartient au package principal. Cela signifie également que le fichier contient une
// fonction main, qui est le point d'entrée du programme.
package main

// On importe plusieurs paquets nécessaires pour le programme :

//Les deux derniers sont spécifiques au pilote MongoDB pour Go. Ils sont utilisés pour interagir avec une db MongoDB.
import (
	"github.com/gin-gonic/gin"
	"projet-mobile-backend-go/config"
	"projet-mobile-backend-go/database"

	"fmt"
	"log"

	"projet-mobile-backend-go/routes"
)

// La fonction principale du programme.
func main() {

	// Gin tourne en mode "debug" par défaut mais avec cette ligne on passe en mode "release" pour des raisons de
	//performances et de sécurité
	gin.SetMode(gin.ReleaseMode)

	// Pour la gestion des configurations, y compris le chargement des variables d'environnement.
	config.LoadEnv()
	// Pour Initialiser la connexion et tout ce qui est lié aux interactions avec MongoDB
	database.Init() // z la connexion à MongoDB

	// Cette valeur ne va jamais changer
	const port = ":3000"

	// Pour le run faire "go run main.go" et pour qu'un message s'affiche dans le terminal
	fmt.Println("(http://localhost:3000) - Serve r started on port :", port)

	route := routes.RegisterRoutes()

	// écoute sur le port 3000
	err := route.Run(port)

	if err != nil {
		log.Println("Error starting the server:", err)
	}
}

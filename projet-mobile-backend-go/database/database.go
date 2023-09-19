// C'est pour établir une connexion avec la BDD NoSQL : une BDD MongoDB et confirmer que la connexion est bien établie
// avec le serveur

package database

import (
	"fmt"
	"log"

	"go.mongodb.org/mongo-driver/bson"
	"go.mongodb.org/mongo-driver/mongo"
	"go.mongodb.org/mongo-driver/mongo/options"

	"context"
	"crypto/tls"

	"projet-mobile-backend-go/config"
	"projet-mobile-backend-go/models"
)

var Client *mongo.Client

func Init() {
	dbUser, dbPass := config.GetDBCredentials()

	connectionString := fmt.Sprintf("mongodb+srv://%s:%s@cluster0.cimmt4s.mongodb.net/?retryWrites=true&w=majority", dbUser, dbPass)

	// Utiliser la methode SetServerAPIOptions() afin de définir la version de l'API stable sur 1
	serverAPI := options.ServerAPI(options.ServerAPIVersion1)

	opts := options.Client().ApplyURI(connectionString).SetServerAPIOptions(serverAPI)

	// Ajout du Code pour configurer TLS (mais juste pour le test)
	tlsConfig := &tls.Config{InsecureSkipVerify: true}
	opts.SetTLSConfig(tlsConfig)

	// Ici on crée un nouveau utilisateur pour se connecter au serveur
	var err error

	Client, err = mongo.Connect(context.TODO(), opts)
	if err != nil {
		log.Fatalf("An error occurred: %v", err)
	}

	// Envoyer un ping afin de confirmer si la connexion est bien établie
	if err := Client.Database("admin").RunCommand(context.TODO(), bson.D{{"ping", 1}}).Err(); err != nil {
		panic(err)
	}
}

// FindUserByEmail : recherche un utilisateur dans la base de données MongoDB en fonction de son email
func FindUserByEmail(email string) (*models.User, error) {
	var user models.User
	collection := Client.Database("myAppMHP").Collection("users")
	err := collection.FindOne(context.TODO(), bson.M{"email": email}).Decode(&user)
	if err != nil {
		log.Println("Error fetching user:", err)
		return nil, err
	}

	return &user, nil
}

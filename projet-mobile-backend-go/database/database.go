// C'est pour établir une connexion avec la BDD NoSQL :
// On se connecte à une BDD MongoDB locale, // on sélectionne une BDD et une collection spécifique (pas encore)

package database

import (
	"go.mongodb.org/mongo-driver/mongo"
)

var Client *mongo.Client

func Init() {
}

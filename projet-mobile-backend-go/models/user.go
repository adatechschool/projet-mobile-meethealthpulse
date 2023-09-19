package models

// Définir la structure "User" :

type User struct {
	ID          string `json:"id"`
	Username    string `json:"username" bson:"username"`
	DateOfBirth string `json:"dateOfBirth" bson:"dateOfBirth"`
	Email       string `json:"email" bson:"email"`
	Password    string `json:"password" bson:"password"`
}

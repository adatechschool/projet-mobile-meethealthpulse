package config

import (
	"github.com/joho/godotenv"
	"log"
	"os"
)

func LoadEnv() {
	err := godotenv.Load()
	if err != nil {
		log.Fatal("Error loading .env file")
	}
}

func GetDBCredentials() (string, string) {
	// pour ajouter une éventuelle : apiKey := os.Getenv("API_KEY")
	return os.Getenv("DB_USER"), os.Getenv("DB_PASS")
}

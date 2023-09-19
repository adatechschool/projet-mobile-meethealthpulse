//
//  AuthentificationService.swift
//  meet_health_pulse
//
//  Created by Hanâa Belhamidi on 18/09/2023.
//

// On définit une classe AuthentificationService avec deux méthodes (signUp et logIn) qui envoient deux requêtes POST à un serveur : une pour créer un nouvel utilisateur l'autre pour se connecter

// Importation du module Foundation, qui contient les types et fonctionnalités de base (utilisés dans toutes les applications Swift)
import Foundation

// Déclaration de la classe AuthentificationService
class AuthentificationService {
    
    // Définition d'une constante shared de la classe elle-même, initialisée avec une nouvelle instance de AuthentificationService
    // C'est un pattern Singleton, où une seule instance de cette classe sera utilisée partout dans l'application
    static let shared = AuthentificationService()

    // La méthode signUp prend un nom d'utilisateur et un mot de passe en paramètres, les convertit en format JSON, et les envoie au serveur. Une fois la requête terminée, elle appelle un callback avec le résultat de la requête.
    // Completion  est un callback qui sera appelé une fois que la tâche asynchrone est terminée. Il retourne un Bool indiquant le succès ou l'échec et une erreur facultative
    func signUp(username: String, dateOfBirth: String, email: String, password: String, completion: @escaping (Bool, Error?) -> Void) {
        
        // Création d'une constante url en utilisant le constructeur URL elle pointe vers un endpoint "signup" sur "localhost" avec le port 3000
        let url = URL(string: "http://localhost:3000/signup")!
        
        //  Création d'une variable request qui représente une requête web à partir de l'URL précédemment définie
        var request = URLRequest(url: url)
        
        // Définition de la méthode HTTP de la requête comme étant "POST".
        request.httpMethod = "POST"

        // Création d'un dictionnaire avec les clés "username" et "password", les valeurs fournies en paramètres
        let dictionary = [
            "username": username,
            "dateOfBirth": dateOfBirth,
            "email": email,
            "password": password
        ]
        
        // Tenter de convertir du dictionnaire en données JSON. (Si la conversion échoue pour une raison quelconque, data sera nil)
        let data = try? JSONSerialization.data(withJSONObject: dictionary)

        // Attribution des données JSON créées comme corps de la requête HTTP
        request.httpBody = data
        
        // Ajout d'un en-tête à la requête pour indiquer que le contenu envoyé est de type JSON
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Ajout d'un autre en-tête pour indiquer que l'application attend une réponse de type JSON.
        request.addValue("application/json", forHTTPHeaderField: "Accept")

        //  Initialisation d'une tâche pour envoyer la requête qui prendra la requête, l'enverra, et exécutera le bloc de code fourni une fois la requête terminée.
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            // Vérification si les données ont été reçues et qu'il n'y a pas d'erreur. (Si l'une de ces conditions n'est pas remplie, le callback est appelé avec false et l'erreur fournie)
            guard let _ = data, error == nil else {
                completion(false, error)
                return
            }
            
            //  Convertion la réponse en HTTPURLResponse pour accéder au code de statut et d'autres propriétés
            if let httpResponse = response as? HTTPURLResponse {
                
                // Vérification du code de statut de la réponse. (Si c'est 200 (OK), cela signifie que la requête a réussi. Sinon, il signale une erreur avec le code de statut reçu)
                if httpResponse.statusCode == 200 {
                    completion(true, nil)
                } else {
                    completion(false, NSError(domain: "", code: httpResponse.statusCode, userInfo: nil))
                }
                // Si la réponse ne peut pas être convertie en HTTPURLResponse, il signale une erreur
            } else {
                completion(false, error)
            }
        }
        // Terminer le bloc de code pour la tâche et démarrer la tâche avec resume()
        task.resume()
    }
    
    
}



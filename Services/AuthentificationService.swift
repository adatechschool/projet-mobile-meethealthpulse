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
    func signUp(username: String, dateOfBirth: String, email: String, password: String, completion: @escaping (Bool, AuthResponse?, Error?) -> Void) {
        
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
        do {
            let data = try JSONSerialization.data(withJSONObject: dictionary)
            // Définir le corps de la requête HTTP avec les données JSON converties
            request.httpBody = data
        } catch {
            print("Failed to serialize data:", error)
            completion(false, nil, error)
            return
        }
        
        // Attribution des données JSON créées comme corps de la requête HTTP
        //request.httpBody = data
        
        // Ajout d'un en-tête à la requête pour indiquer que le contenu envoyé est de type JSON
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Ajout d'un autre en-tête pour indiquer que l'application attend une réponse de type JSON.
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        //  Initialisation d'une tâche pour envoyer la requête qui prendra la requête, l'enverra, et exécutera le bloc de code fourni une fois la requête terminée.
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            // Vérification si les données ont été reçues et qu'il n'y a pas d'erreur. (Si l'une de ces conditions n'est pas remplie, le callback est appelé avec false et l'erreur fournie)
            guard let data = data, error == nil else {
                completion(false, nil, error)
                
                return
            }
            
            //  Convertion la réponse en HTTPURLResponse pour accéder au code de statut et d'autres propriétés
            if let httpResponse = response as? HTTPURLResponse {
                
                // Vérification du code de statut de la réponse. (Si c'est 200 (OK), cela signifie que la requête a réussi. Sinon, il signale une erreur avec le code de statut reçu)
                if httpResponse.statusCode == 200 {
                    
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(AuthResponse.self, from: data)
                        // Ici on renvoye le "AuthResponse"
                        completion(true, response, nil)
                    } catch {
                        print("Erreur lors de la décodage:", error)
                        completion(false, nil, error)
                    }
                    
                    
                } else {
                    let error = NSError(domain: "", code: httpResponse.statusCode, userInfo: nil)
                    completion(false, nil, error)
                    
                }
                // Si la réponse ne peut pas être convertie en HTTPURLResponse, il signale une erreur
            } else {
                let unexpectedError = NSError(domain: "InvalidResponse", code: 0, userInfo: nil)
                completion(false, nil, unexpectedError)
            }
        }
        // Terminer le bloc de code pour la tâche et démarrer la tâche avec resume()
        task.resume()
    }
    
    // Pareil pour la fonction logIn elle effectue une requête POST à l'URL http://localhost:3000/login avec un email et un mot de passe au format JSON, puis appelle un bloc de fin (closure) completion qui retourne un Bool (pour indiquer si la connexion est réussie ou non) et une éventuelle "Error"
    func logIn(email: String, password: String, completion: @escaping (Bool, AuthResponse?, Error?) -> Void) {
        
        // Créer un objet URL pointant vers "http://localhost:3000/login"
        let url = URL(string: "http://localhost:3000/login")!
        
        // Initialiser une nouvelle requête HTTP à partir de l'URL précédemment créée
        var request = URLRequest(url: url)
        
        // Définir la méthode HTTP de la requête sur "POST"
        request.httpMethod = "POST"
        
        // Créer un dictionnaire contenant l'email et le mot de passe fournis
        let dictionary = ["email": email, "password": password]
        
        // Tenter de convertir le dictionnaire en données JSON. Si la sérialisation échoue : data sera nil
        do {
            let data = try JSONSerialization.data(withJSONObject: dictionary)
            // Définir le corps de la requête HTTP avec les données JSON converties
            request.httpBody = data
        } catch {
            print("Failed to serialize data:", error)
            completion(false, nil, error)
            return
        }
        
        // Ajout d'un en-tête HTTP à la requête indiquant que le type de contenu envoyé est du JSON
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // Ajout d'un autre en-tête HTTP indiquant que la requête accepte une réponse en JSON
        request.addValue("application/json", forHTTPHeaderField: "Accept")
        
        // Créer une tâche qui va exécuter la requête HTTP. Une fois la requête terminée, le bloc de code (closure) fourni sera exécuté
        let task = URLSession.shared.dataTask(with: request) { data, response, error in
            
            // Ici on vérifie si des données ont été reçues et s'il n'y a pas d'erreur. Si l'une de ces conditions n'est pas remplie, la fonction completion est appelée avec false et l'erreur
            guard let data = data, error == nil else {
                completion(false, nil, error)
                return
            }
            // Si la réponse peut être convertie en une réponse HTTP et que le code de statut est 200 : "OK", alors la fonction completion est appelée avec true pour indiquer que la connexion a réussi
            if let httpResponse = response as? HTTPURLResponse {
                if httpResponse.statusCode == 200 {
                    do {
                        let decoder = JSONDecoder()
                        let response = try decoder.decode(AuthResponse.self, from: data)
                        // Ici on renvoie le "AuthResponse"
                        completion(true, response, nil)
                    } catch {
                        print("Erreur lors de la décodage:", error)
                        completion(false, nil, error)
                    }
                } else {
                    let statusCode = httpResponse.statusCode
                    completion(false, nil, NSError(domain: "", code: statusCode, userInfo: nil))
                }
            } else {
                // Si la réponse ne peut pas être convertie en HTTPURLResponse
                completion(false, nil, NSError(domain: "", code: 0, userInfo: nil))
            }
        }
        // Ici on lance la tâche HTTP. La fonction dataTask(with:completion:) ne démarre pas la tâche par elle-même c'est pourquoi on doit appeler resume() pour démarrer ou redémarrer la tâche
        task.resume()
    }
    
}



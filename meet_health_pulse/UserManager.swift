//
//  UserManager.swift
//  meet_health_pulse
//
//  Created by Hanâa Belhamidi on 20/09/2023.
//

import Foundation

// C'est la partie qui gère la réponse type "AuthModels.swift" pour récupérer la structure JSON que le serveur renvoie comme réponse
struct AuthResponse: Decodable {
    let username: String
    let token: String?
    
}

//  C'est la partie qui gère le "UserManager.swift" pour récupérer le username
class UserManager: ObservableObject {
    @Published var username: String? = nil
    @Published var token: String? = nil

    func setUser(from response: AuthResponse) {
        self.username = response.username
        self.token = response.token
    }
}

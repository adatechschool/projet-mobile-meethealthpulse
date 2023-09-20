//
//  meet_health_pulseApp.swift
//  meet_health_pulse
//
//  Created by Hanâa Belhamidi on 28/08/2023.
//

import SwiftUI

@main
struct meet_health_pulseApp: App {
    // Ajout de UserManager pour gérer les données entrantes : comme le username..
    @StateObject var userManager = UserManager()
       
       var body: some Scene {
           WindowGroup {
               
               ContentView()
                   .environmentObject(userManager)
           }
       }
    
}

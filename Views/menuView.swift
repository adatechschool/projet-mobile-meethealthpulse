//
//  menuView.swift
//  meet_health_pulse
//
//  Created by Hanâa Belhamidi on 31/08/2023.
//

import SwiftUI

struct MenuView: View {
    var body: some View {
        NavigationView {
            ZStack {
                VStack {
                    
                    HStack {
                        
                        // Lien vers "Profil"
                        NavigationLink(destination: ProfilView().navigationBarBackButtonHidden(true)) {
                            Image(systemName: "person.fill")
                                .foregroundColor(Color.black)
                                .imageScale(.large)
                        }
                        
                        // Ajout du padding à gauche
                        .padding(.leading)
                        
                        // ça permet de pousser le contenu vers la droite laissant l'icône à gauche
                        Spacer()
                    }
                    Spacer()
                    
                    // Ajout de la liste des liens de navigation
                    List {
                        
                        // Lien vers "AccountSettings"
                        NavigationLink(destination: AccountSettingsView()) {
                            HStack {
                                
                                // Ajout de l'icon "person.circle"
                                Image(systemName: "person.circle")
                                    .imageScale(.medium)
                                Text("Account Settings")
                                    .multilineTextAlignment(.center)
                            }
                        }
                        
                        // Lien vers "Notifications"
                        NavigationLink(destination: Text("Notifications")) {
                            HStack {
                                
                                // Ajout de l'icon "bell"
                                Image(systemName: "bell")
                                    .imageScale(.medium)
                                Text("Notifications")
                                    .multilineTextAlignment(.center)
                            }
                        }
                        
                        // Lien vers "Find Friends"
                        NavigationLink(destination: FindFriendsView()) {
                            HStack {
                                
                                // Ajout de l'icon "person.badge.plus"
                                Image(systemName: "person.badge.plus")
                                    .imageScale(.medium)
                                Text("Find Friends")
                                    .multilineTextAlignment(.center)
                            }
                        }
                        
                        // Lien vers "HomeView"
                        NavigationLink(destination: WelcomeView().navigationBarBackButtonHidden(true)) {
                            HStack {
                                
                            // Ajout de l'icon "Sign Out"
                            Image(systemName: "rectangle.lefthalf.inset.filled.arrow.left")
                                .imageScale(.medium)
                            Text("Sign Out")
                                .multilineTextAlignment(.center)
                            }
                        }
                    }
                }
                .padding( )
            }
            
            // Définir le titre de navigation "Menu"
            .listStyle(PlainListStyle())
            .navigationTitle("Menu")
            
            // Pour afficher le titre de manière réduite
            .navigationBarTitleDisplayMode(.inline)
            
            // Pour cacher le bouton de retour par défaut
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct menuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}

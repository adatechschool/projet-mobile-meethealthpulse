//
//  menuView.swift
//  meet_health_pulse
//
//  Created by Hanâa Belhamidi on 31/08/2023.
//

import SwiftUI

struct menuView: View {
    var body: some View {
        NavigationView {
            ZStack {
                // Ajout des bords arrondis
                Color.white
                    .cornerRadius(8)
                VStack {
                    HStack {
                        // Lien vers "Profil"
                        NavigationLink(destination: ProfilView()) {
                            HStack {
                            // Ajout de l'icon "back"
                                Image(systemName: "arrow.left.circle.fill")
                                    .foregroundColor(Color.black)
                                    .padding(.leading)
                                    .imageScale(.large)
                            }
                        }
                    // Ajout du titre "Menu"
                    Text("Menu")
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.leading, -45.0)
                        .frame(maxWidth: .infinity, alignment: .center)
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
                        NavigationLink(destination: Text("Find Friends")) {
                            HStack {
                                // Ajout de l'icon "person.badge.plus"
                                Image(systemName: "person.badge.plus")
                                    .imageScale(.medium)
                                Text("Find Friends")
                                    .multilineTextAlignment(.center)
                            }
                        }
                        // Lien vers "HomeView"
                        NavigationLink(destination: Text("HomeView")) {
                            HStack {
                            // Ajout de l'icon "Sign Out"
                            Image(systemName: "rectangle.lefthalf.inset.filled.arrow.left")
                                .imageScale(.medium)
                            Text("Sign Out")
                                .multilineTextAlignment(.center)
                            }
                        }
                    }
                }// Ajout du style shadow
                .shadow(color: Color.black.opacity(0.2),
                         radius: 5,
                         x: 0,
                         y: 2)
            }
        }
    }
}

struct menuView_Previews: PreviewProvider {
    static var previews: some View {
        menuView()
    }
}

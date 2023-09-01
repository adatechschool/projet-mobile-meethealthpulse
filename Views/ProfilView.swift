//
//  ProfilView.swift
//  meet_health_pulse
//
//  Created by Hanâa Belhamidi on 31/08/2023.
//

import SwiftUI

struct ProfilView: View {
    
    // Déclarer une var qui est un état "a state" pour suivre si le bouton "Sign Out" a été appuyé
    @State private var showHomeView = false
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack {
                    HStack {
                        
                        // Lien vers "Menu"
                        NavigationLink(destination: MenuView()) {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(Color.black)
                                .imageScale(.large)
                        }
                        
                        // Ajout du padding à gauche
                        .padding(.leading)
                        
                        // ça permet de pousser le contenu vers la droite laissant l'icône à gauche
                        Spacer()
                    }
                    Spacer()
                }
                
                VStack {
                    
                    // Affichage de la photo de profil
                    Image("imagepardefault")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                    
                    // Ajout de l'icon du Sport ou activité préféré(e)
                    Image(systemName: "figure.open.water.swim")
                        .foregroundColor(Color.black)
                        .padding(.leading)
                        .imageScale(.large)
                    
                    // Ajout du Welcome (+ Pseudo du profil)
                    Text("Welcome 🥳")
                        .font(.title)
                        .fontWeight(.black)
                    
                    // ça permet de pousser le contenu vers le bas d'une hauteur de 200
                    Spacer()
                       .frame(height: 200)
                            
                            // Sign Out Button pour revenir à la HomeView
                            Button(action: {
                                showHomeView.toggle()
                            }
                            ) {
                                HStack {
                                    Image(systemName: "rectangle.lefthalf.inset.filled.arrow.left")
                                        .imageScale(.medium)
                                        .foregroundColor(Color.white)
                                    Text("Sign Out")
                                        .foregroundColor(Color.white)
                                }
                            }
                            .buttonStyle(.borderedProminent)
                            .tint(Color.black)
                            .padding()
                }
            }
            // Définir le titre de navigation "My Profil"
            .listStyle(PlainListStyle())
            .navigationTitle("My Profil")
        }
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}

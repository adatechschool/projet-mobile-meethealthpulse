//
//  ProfilView.swift
//  meet_health_pulse
//
//  Created by Hanâa Belhamidi on 31/08/2023.
//

import SwiftUI

struct ProfilView: View {
    var body: some View {
        NavigationView{
            ZStack{
                VStack {
                    HStack {
                        //Spacer() // ça permet de pousser le contenu vers la gauche laissant l'icône à droite
                        
                        // Lien vers "Menu"
                        NavigationLink(destination: MenuView()) {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(Color.black)
                                .imageScale(.large)
                        }
                        //.padding(.trailing)// Ajout du padding à droite
                        
                        
                        // Ajout du padding à gauche
                        .padding(.leading)
                        // ça permet de pousser le contenu vers la droite laissant l'icône à gauche
                        Spacer()
                    }
                    Spacer()
                }
                .padding()
                VStack{
                    // Ajout de la photo de profil
                    Image("imagepardefault")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                    // Ajout de l'icon du Sport
                    Image(systemName: "figure.open.water.swim")
                        .foregroundColor(Color.black)
                        .padding(.leading)
                        .imageScale(.large)
                    // Ajout du Welcome (+ Pseudo du profil)
                    Text("Welcome 🥳")
                        .font(.title)
                        .fontWeight(.black)
                }
                
            }
            // Définir le titre de navigation
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

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
                        // Lien vers "Menu"
                        NavigationLink(destination: MenuView()) {
                            Image(systemName: "line.3.horizontal")
                                .foregroundColor(Color.black)
                                .imageScale(.large)
                        }
                        // Ajout du titre "My Profil"
                        Text("My Profil")
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding(.leading, -45.0)
                            .frame(maxWidth: .infinity, alignment: .center)
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
        }
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}

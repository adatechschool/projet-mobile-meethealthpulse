//
//  ProfilView.swift
//  meet_health_pulse
//
//  Created by Hanâa Belhamidi on 31/08/2023.
//

import SwiftUI

struct ProfilView: View {
    
    var isNewlyRegistered: Bool = false
    
    // Déclarer une var qui est un état "a state" pour suivre si le bouton "Sign Out" a été appuyé
    @State private var showHomeView = false
    
    @EnvironmentObject var userManager: UserManager
    
    @State private var shouldShowWelcome = false
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack {
                    HStack {
                        
                        // Lien vers "Menu"
                        NavigationLink(destination: MenuView().navigationBarBackButtonHidden(true)) {
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
                    //Image(systemName: "figure.open.water.swim")
                        //.foregroundColor(Color.black)
                        //.padding(.leading)
                        //.imageScale(.large)
                    
                    // Ajout du Welcome (+ Pseudo du profil)
                
                    VStack {
                               if let username = userManager.username {
                                   Text("Welcome \(username)🥳")
                                       .font(.title)
                                       .fontWeight(.black)
                               } else {
                                   Text("Not logged in🥺")
                                       .font(.title)
                                       .fontWeight(.black)
                               }
                           }
                    
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
            
            // Pour afficher le titre de manière réduite
            .navigationBarTitleDisplayMode(.inline)
            
            // Pour cacher le bouton de retour par défaut
            .navigationBarBackButtonHidden(true)
        }
        // .onAppear permet d'exécuter du code lorsque la vue apparaît
        // Ici, on ajoute un nouvel état shouldShowWelcome.
        // Lorsque la ProfilView apparaît (grâce à .onAppear), si le username est nil, on met shouldShowWelcome à true, ce qui provoque l'affichage de la WelcomeView en plein écran
        .onAppear {
                if !isNewlyRegistered && userManager.username == nil {
                    shouldShowWelcome = true
                }
            }
        // Pour afficher la HomeView de manière qu'elle recouvre tout l'écran
        .fullScreenCover(isPresented: $shouldShowWelcome) {
            WelcomeView()
       }
        .fullScreenCover(isPresented: $showHomeView) {
           WelcomeView()
       }
       
    }
}

struct ProfilView_Previews: PreviewProvider {
    static var previews: some View {
        ProfilView()
    }
}

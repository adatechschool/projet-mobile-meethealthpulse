//
//  AccountSettingsView.swift
//  meet_health_pulse
//
//  Created by Hanâa Belhamidi on 31/08/2023.
//

import SwiftUI

struct AccountSettingsView: View {
    // Déclarer une var qui est un état "a state" pour suivre si le bouton "Sign Out" a été appuyé
    @State private var showProfilView = false
    
    // Déclarer les variables qui vont contenir les Inputs
    @State private var aboutMeInput = ""
    @State private var activityInput = ""
    @State private var localisationInput = ""
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack(alignment: .center) {
                    
                    // Ajout de l'image par défaut
                    Image("imagepardefault")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 280, height: 280)
                    
                    // Ajout du "add a new photo"
                    Text("Add a new photo")
                        .font(.body)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .center)
                    
                    // Ajout de l'icon pour modifier la photo de profil
                    Image(systemName: "camera.badge.ellipsis")
                        .foregroundColor(Color.black)
                        .padding(.all, -10.0)
                        .imageScale(.large)
                    
                    // Ajout du text "Add a new photo" avec un alignement à gauche
                    Text("Add a new About Me")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    // Ajout de "about me input"
                    TextField("Exemple : I'm Athéna & I like Archery.", text: $aboutMeInput)
                        .padding()
                            .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1))
                    
                            // Ajout du padding à droite et à gauche
                            .padding(.horizontal, 15)
                    
                    // Ajout du text "Add a new Activity or Sport"
                    Text("Add a new Activity or Sport")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    // Ajout de "activity input"
                    TextField("Exemple : My favorite sports are fencing & archery.", text: $activityInput)
                        .padding()
                            .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1))
                    
                            // Ajout du padding à droite et à gauche
                            .padding(.horizontal, 15)
                    
                    // Ajout du text "Add your localisation"
                    Text("Add your localisation")
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading)
                    
                    // Ajout de "localisation input"
                    TextField("Exemple : Currently, I leave in Paris.", text: $localisationInput)
                        .padding()
                            .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1))
                    
                            // Ajout du padding à droite et à gauche
                            .padding(.horizontal, 15)
                    
                    // Save Button pour enregistrer et revenir à ProfilView
                    Button(action: {
                        showProfilView.toggle()
                    }
                    ) {
                        HStack {
                            Image(systemName: "square.and.arrow.down")
                                .imageScale(.medium)
                                .foregroundColor(Color.white)
                            Text("Save")
                                .foregroundColor(Color.white)
                        }
                    }
                    .buttonStyle(.borderedProminent)
                    .tint(Color.black)
                    .padding()
                }
            }
            // Définir le titre de navigation
            .listStyle(PlainListStyle())
            .navigationTitle("Account Settings")
            
            // Pour afficher le titre de manière réduite
            .navigationBarTitleDisplayMode(.inline)
            
            // Pour cacher le bouton de retour par défaut
            .navigationBarBackButtonHidden(true)
        }
        // Pour afficher ProfilView de manière qu'elle recouvre tout l'écran
        .fullScreenCover(isPresented: $showProfilView) {
            ProfilView()
        }
    }
}

struct AccountSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsView()
    }
}

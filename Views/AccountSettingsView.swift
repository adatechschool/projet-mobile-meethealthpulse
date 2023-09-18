//
//  AccountSettingsView.swift
//  meet_health_pulse
//
//  Created by Hanâa Belhamidi on 31/08/2023.
//

import SwiftUI

struct AccountSettingsView: View {
    // Déclarer une var qui est un état "a state" pour suivre si le bouton "Save" a été appuyé
    @State private var showProfilView = false
    
    // Déclarer les variables qui vont contenir les Inputs
    @State private var aboutMeInput = ""
    @State private var ageInput = ""
    @State private var activityInput = ""
    @State private var localisationInput = ""
    
    // Choix des valeurs du picker
    @State private var selectedGender = 0
    let gender = ["Not disclose", "Woman", "Man"]
    
    @State var task = ChooseActivities(name: "", servingActivities: [])
    
    /*let allGoals: [Goal] = [
        Goal(name: "Learn Japanese"),
        Goal(name: "Learn SwiftUI"),
        Goal(name: "Learn Serverless with Swift")
    ]*/
    
    @ObservedObject private var viewModel = AccountSettingsViewModel()
    
    var body: some View {
        NavigationView{
            //ZStack{
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
                    
                    ScrollView{
                        // Ajout du text "Add a new About me" avec un alignement à gauche
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
                        
                        // Ajout du text "Add your Age" avec un alignement à gauche
                        
                            Text("Add your gender")
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .padding(.leading)
                        VStack{
                            // Ajout de "about me input"
                            Picker("Select an option", selection: $selectedGender){
                                ForEach(0..<gender.count, id: \.self) { index in
                                    Text(gender[index])
                                }
                            }
                            .pickerStyle(SegmentedPickerStyle())
                            
                            Text("Selected : \(gender[selectedGender])")
                            
                            Spacer()
                        }
                        .padding(.horizontal, 15)
                        
                        
                        // Ajout du text "Add your Age" avec un alignement à gauche
                        Text("Add your age")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        
                        // Ajout de "about me input"
                        TextField("Exemple : I'm 19 years old.", text: $ageInput)
                            .padding()
                                .overlay(RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1))
                        
                                // Ajout du padding à droite et à gauche
                                .padding(.horizontal, 15)
                         
                        
                        // Ajout du text "Add a new Activity or Sport"
                        Text("Add a new Activity or Sport")
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        
                        MultiSelector(
                            label: Text("Choose activities"),
                            options: viewModel.activities,
                            optionToString: { $0.name },
                            selected: $task.servingActivities
                        )
                        .padding()
                            .overlay(RoundedRectangle(cornerRadius: 8)
                                .stroke(Color.gray, lineWidth: 1))
                            .padding(.horizontal, 15)
                        
                        /*
                         // Ajout de "activity input"
                        TextField("Exemple : My favorite sports are fencing & archery.", text: $activityInput)
                            .padding()
                                .overlay(RoundedRectangle(cornerRadius: 8)
                                    .stroke(Color.gray, lineWidth: 1))
                        
                                // Ajout du padding à droite et à gauche
                                .padding(.horizontal, 15)
                        */
                        
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
                    }
                    
                    
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
            //}
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

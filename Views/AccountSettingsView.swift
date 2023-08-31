//
//  AccountSettingsView.swift
//  meet_health_pulse
//
//  Created by Hanâa Belhamidi on 31/08/2023.
//

import SwiftUI

struct AccountSettingsView: View {
    var body: some View {
        NavigationView{
            ZStack{
                VStack {
                    // Ajout du titre "My Profil"
                    Text("Add a new photo")
                        .font(.title2)
                        .fontWeight(.medium)
                        .multilineTextAlignment(.center)
                        .padding(.leading, -45.0)
                        .frame(maxWidth: .infinity, alignment: .center)
                    // Ajout de la photo de profil
                    Image("imagepardefault")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300, height: 300)
                    Spacer()
                }
                
            }
            // Définir le titre de navigation
            .listStyle(PlainListStyle())
            .navigationTitle("Account Settings")
        }
    }
}

struct AccountSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsView()
    }
}

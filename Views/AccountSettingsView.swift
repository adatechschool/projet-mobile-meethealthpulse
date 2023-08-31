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
                    HStack {
                        // Lien vers "Menu"
                        NavigationLink(destination: Text("Menu")) {
                            HStack {
                                // Ajout de l'icon "back"
                                Image(systemName: "arrow.left.circle.fill")
                                    .foregroundColor(Color.black)
                                    .padding(.leading)
                                    .imageScale(.large)
                            }
                        }
                        // Ajout du titre "Account Settings"
                        Text("Account Settings")
                            .font(.title2)
                            .fontWeight(.bold)
                            .multilineTextAlignment(.center)
                            .padding(.leading, -45.0)
                            .frame(maxWidth: .infinity, alignment: .center)
                    }
                    Spacer()
                }
            }
        }
    }
}

struct AccountSettingsView_Previews: PreviewProvider {
    static var previews: some View {
        AccountSettingsView()
    }
}

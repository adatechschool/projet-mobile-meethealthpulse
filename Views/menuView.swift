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
                Color.white
                    .cornerRadius(8)
                VStack {
                    HStack {
                        
                    Text("Menu")
                        .font(.title2)
                        .fontWeight(.bold)
                        .multilineTextAlignment(.center)
                        .padding(.leading, -45.0)
                        .frame(maxWidth: .infinity, alignment: .center)
                    }
                    Spacer()
                    List {
                        NavigationLink(destination: Text("Account Settings")) {
                            HStack {
                                
                                Text("Account Settings")
                                    .multilineTextAlignment(.center)
                            }
                        }
                        NavigationLink(destination: Text("Notifications")) {
                            HStack {
                                
                                Text("Notifications")
                                    .multilineTextAlignment(.center)
                            }
                        }
                        NavigationLink(destination: Text("Find Friends")) {
                            HStack {
                                
                                Text("Find Friends")
                                    .multilineTextAlignment(.center)
                            }
                        }
                        NavigationLink(destination: Text("HomeView")) {
                            HStack {
                            
                            Text("Sign Out")
                                .multilineTextAlignment(.center)
                            }
                        }
                    }
                }.shadow(color: Color.black.opacity(0.2),
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

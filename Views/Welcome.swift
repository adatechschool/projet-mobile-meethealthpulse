//
//  Welcome.swift
//  meet_health_pulse
//
//  Created by pierre Jezequel on 31/08/2023.
//

import SwiftUI

struct Welcome: View {
    var body: some View {
        VStack {
            
            Text("Welcome to MHP")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("Primary"))
                
                
            Image ("LogoMHP")
                .resizable()
                .frame(width: 300.0, height: 300.0)
                .clipShape(Circle())
            
            Text("Meet, Health, Pulse")
                .fontWeight(.bold)
                .foregroundColor(Color("Primary"))
                .frame(width: 250.0, height: 50.0)
                .overlay{
                    Rectangle().stroke(.black)
                }
            
            HStack {
                Button(action: {
                    // Go to Create account view
                }, label: {
                    Text("Sign In")
                        .frame(width: 150,
                               height: 50,
                               alignment: .center)
                        .background(Color("Primary"))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
                .padding()
                
                Button(action: {
                    //  Go to Log in view
                    
                }, label: {
                    Text("Log In")
                        .fontWeight(.bold)
                        .frame(width: 150,
                               height: 50,
                               alignment: .center)
                        .background(Color("Primary"))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })
                .padding()
            }
                
            
            Spacer()
        }
        .padding(.top,50)
    }
}

struct Welcome_Previews: PreviewProvider {
    static var previews: some View {
        Welcome()
    }
}

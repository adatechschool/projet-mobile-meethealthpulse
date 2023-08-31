//
//  LogIn.swift
//  meet_health_pulse
//
//  Created by pierre Jezequel on 31/08/2023.
//

import SwiftUI

class FormLogInViewModel: ObservableObject{
    @State var username = ""
    @State var dateOfBirth = ""
    @State var email = ""
    @State var password = ""
    @State var passwordAgain = ""
    
}

struct LogIn: View {
    @StateObject var viewModel = FormLogInViewModel()
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center){
                HStack {
                    Text("Log in below or")
                    Group {
                        Text("create an account")
                            .bold()
                        .underline()
                    }
                }
                
                Form {
                    Section(header: Text("Email")) {
                        TextField("email@example", text: $viewModel.email)
                    }
                    
                    Section(
                        header: Text("Password"),
                        footer: Text("Forgot Password")
                            .underline()
                    ) {
                            
                            SecureField("Password", text: $viewModel.password)
                            }
                }
                
                Button(action: {
                    // Send to Database
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
            .navigationTitle("Welcome back!")
        }
        
    }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogIn()
    }
}

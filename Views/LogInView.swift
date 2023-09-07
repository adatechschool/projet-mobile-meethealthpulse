//
//  LogIn.swift
//  meet_health_pulse
//
//  Created by pierre Jezequel on 31/08/2023.
//

import SwiftUI

/*class FormLogInViewModel: ObservableObject{
    @State var email = ""
    @State var password = ""
    
    
}*/

struct LogInView: View {
    //@State  var viewModel = FormLogInViewModel()
    @State private var createAccount = false
    @State private var logOn = false
    @State private var email = ""
    @State private var password = ""
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center){
                Text("Welcome back")
                    .font(.title)
                    .bold()
                    .padding(.bottom,5)
                HStack {
                    Text("Log in below or")
                    
                    Button {
                        createAccount.toggle()
                    } label: {
                        Text("create an account")
                            .underline()
                            .foregroundColor(.black)
                            .fontWeight(.bold)
                    }

                    
                }
                
                Form {
                    Section(header: Text("Email")) {
                        EmailView()
                        //TextField("email@example", text: //$viewModel.email
                        //$email)
                        
                    }
                    
                    Section(
                        header: Text("Password"),
                        footer: Button(action: {
                            //send an email
                        }, label: {
                            Text("Forgot Password")
                                .font(.subheadline)
                                .underline()
                                .foregroundColor(.gray)
                        })
                    ) {
                            
                            SecureField("Password", text: //$viewModel.password
                            $password)
                    }
                    
                }
                .textInputAutocapitalization(.never)
                
                Button(action: {
                    // Send to Database
                    logOn.toggle()
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
        }
        .fullScreenCover(isPresented: $createAccount) {
            CreateAccountView()
        }
        .fullScreenCover(isPresented: $logOn) {
            ProfilView()
        }
        
        
    }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()
    }
}

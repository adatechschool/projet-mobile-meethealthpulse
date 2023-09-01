//
//  CreateAccount.swift
//  meet_health_pulse
//
//  Created by pierre Jezequel on 31/08/2023.
//

import SwiftUI

class FormViewModel: ObservableObject{
    @State var username = ""
    @State var dateOfBirth = ""
    @State var email = ""
    @State var password = ""
    @State var passwordAgain = ""
    
}

struct CreateAccountView: View {
    
    @StateObject var viewModel = FormViewModel()
    @State private var logIn = false
    @State private var signOn = false
    
    var body: some View {
        NavigationView {
            VStack(alignment: .center){
                Text("Create an account")
                    .font(.title)
                    .bold()
                    .padding(.bottom,5)
                
                    HStack {
                        Text("Enter your account details below or")
                        
                        Button {
                            logIn.toggle()
                        } label: {
                            Text("log in")
                                .underline()
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                        }
                    }
                
                Form {
                    
                    Section(header: Text("Username")){
                        TextField("Username", text: $viewModel.username)
                    }
                    
                    Section(header: Text("Date of birth")) {
                        TextField("DD / MM / YYYY", text: $viewModel.dateOfBirth)
                    }
                    
                    Section(header: Text("Email")) {
                        TextField("email@example", text: $viewModel.email)
                    }
                    
                    Section(
                        header: Text("Password"),
                        footer: Text("Your password must be at least 8 characters long.")) {
                            
                            SecureField("Password", text: $viewModel.password)
                            
                            SecureField("Confirm password", text: $viewModel.passwordAgain)
                    }
                }
                
                Button(action: {
                    // Send to Database
                    signOn.toggle()
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
                
            }
        }
        .fullScreenCover(isPresented: $logIn) {
            LogInView()
        }
        .fullScreenCover(isPresented: $signOn) {
            ProfilView()
        }
        
    }
}

struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
            //.preferredColorScheme(.dark)
    }
}

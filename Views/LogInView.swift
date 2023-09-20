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
    
    @EnvironmentObject var userManager: UserManager
    
    //@State  var viewModel = FormLogInViewModel()
    @State private var createAccount = false
    @State private var logOn = false

    @State private var showAlert = false
    @State private var alertMessage = ""

    @State var username = ""
    @State private var email = ""
    @State private var password = ""
    
    // Fonction qui vérifie si les inputs sont vides ou remplis
    func areFieldsValid() -> Bool {
        return !email.isEmpty && !password.isEmpty
    }
    
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
                        EmailView(email: $email)
                        //TextField("email@example", text: //$viewModel.email
                                  //$email)
                        
                    }
                    
                    Section(
                        header: Text("Password"),
                        footer: Button(action: {
                            // Envoyer un email
                            // TODO: logique pour la récupération du mot de passe
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
                    .textInputAutocapitalization(.never)

                    Button(action: {
                        if !areFieldsValid() {
                            alertMessage = "Veuillez remplir tous les champs."
                            showAlert = true
                            return
                        }
                        AuthentificationService.shared.logIn(email: email, password: password) { success, response, error in
                            if success {
                                print("Connexion réussie!")
                                userManager.username = username
                                logOn.toggle()
                            } else {
                                alertMessage = error?.localizedDescription ?? "Erreur inconnue"
                                showAlert = true
                            }
                        }
                    }, label: {
                        Text("Log In")
                            .fontWeight(.bold)
                            .frame(width: 150, height: 50, alignment: .center)
                            .background(Color("Primary"))
                            .foregroundColor(.white)
                            .cornerRadius(8)
                    })
                    .alert(isPresented: $showAlert) {
                        Alert(title: Text("Erreur de connexion"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                    }
                    .padding()

                }
                .fullScreenCover(isPresented: $createAccount) {
                    CreateAccountView()
                }
                .fullScreenCover(isPresented: $logOn) {
                    ProfilView(isNewlyRegistered: true)
                }
            }
        }
    }
}

struct LogIn_Previews: PreviewProvider {
    static var previews: some View {
        LogInView()

    }
}

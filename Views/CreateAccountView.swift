//
//  CreateAccount.swift
//  meet_health_pulse
//
//  Created by pierre Jezequel on 31/08/2023.
//

import SwiftUI

/*class FormViewModel: ObservableObject{
    @State var username = ""
    @State var dateOfBirth = ""
    @State var email = ""
    @State var password = ""
    @State var passwordAgain = ""
    
}*/

struct CreateAccountView: View {
    
    //@StateObject var viewModel = FormViewModel()
       @State private var logIn = false
       @State private var signUp = false

       @State var selectedDate: Date? = nil
       @State private var presented = false
       
       @State private var showAlert = false
       @State private var alertMessage = ""

       @State var username = ""
       @State var dateOfBirth = ""
       @State var email = ""
       @State var password = ""
       @State var passwordAgain = ""

    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }

    // Fonction qui vérifie si les inputs sont vides ou remplis
    func areFieldsValid() -> Bool {
        return !username.isEmpty &&
        !dateOfBirth.isEmpty &&
        !email.isEmpty
        //&& !password.isEmpty
    }

    var body: some View {
        NavigationView {
            VStack(alignment: .center) {
                
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
                        TextField("Username", text: //$viewModel.username
                                  $username)
                    }
                    
                    
                    Section(header: Text("Date of birth")) {
                        DateField(placeholder: "Choose your birthday", presented: $presented, date: $selectedDate, value: $dateOfBirth)
                        
                    }
                    
                    
                    Section(header: Text("Email")) {
                        EmailView(email: $email)
                        //TextField("email@example", text: //$viewModel.email
                        //$email)
                    }
                    
                    Section(
                        header: Text("Password"),
                        footer: Text("Your password must be at least 8 characters long.")) {
                            
                            SecureField("Password", text: //$viewModel.password
                                        $password)
                            
                            SecureField("Confirm password", text: //$viewModel.passwordAgain
                                        $passwordAgain)
                        }
                }
                .textInputAutocapitalization(.never)
                        
                        Button(action: {
                            if !areFieldsValid() {
                                alertMessage = "Veuillez remplir tous les champs."
                                showAlert = true
                                print("areFieldsValid() =", areFieldsValid())
                                print("username =", username)
                                print("dob =", dateOfBirth)
                                print("email =", email)
                                print("password =", password)
                                print("passwordAgain =", passwordAgain)
                                
                                return
                            }
                            if password != passwordAgain {
                                alertMessage = "Les mots de passe ne correspondent pas."
                                showAlert = true
                                return
                            }
                            
                            AuthentificationService.shared.signUp(username: username, dateOfBirth: dateOfBirth, email: email, password: password) { success, error in
                                if success {
                                    print("Inscription réussie!")
                                    signUp = true
                                } else {
                                    alertMessage = error?.localizedDescription ?? "Erreur inconnue"
                                    showAlert = true
                                }
                            }
                        }, label: {
                            Text("Sign Up")
                                .frame(width: 150, height: 50, alignment: .center)
                                .background(Color("Primary"))
                                .foregroundColor(.white)
                                .cornerRadius(8)
                        })
                        .padding()
                        .alert(isPresented: $showAlert) {
                            Alert(title: Text("Erreur"), message: Text(alertMessage), dismissButton: .default(Text("OK")))
                        }
                    }
                        .fullScreenCover(isPresented: $logIn) {
                            LogInView()
                        }
                        .fullScreenCover(isPresented: $signUp) {
                            ProfilView()
                        }
                }
        .calendarSheet(presented: $presented, value: $dateOfBirth)
    }
}

struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
            //.preferredColorScheme(.dark)
    }
}


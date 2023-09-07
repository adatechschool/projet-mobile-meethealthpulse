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
    @State private var signOn = false
    
    @State var selectedDate: Date? = nil
    @State private var presented = false
    
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
                        TextField("Username", text: //$viewModel.username
                            $username)
                    }
                    
                    
                    Section(header: Text("Date of birth")) {
                        DateField(placeholder: "Choose your birthday", presented: $presented, date: $selectedDate, value: $dateOfBirth)
                            
                    }
                 
                    
                    Section(header: Text("Email")) {
                        EmailView()
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
                //.calendarSheet(presented: $presented, value: $dateOfBirth)
                
                Button(action: {
                    // Send to Database
                    signOn.toggle()
                }, label: {
                    Text("Sign On")
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
        .calendarSheet(presented: $presented, value: $dateOfBirth)
    }
}

struct CreateAccount_Previews: PreviewProvider {
    static var previews: some View {
        CreateAccountView()
            //.preferredColorScheme(.dark)
    }
}

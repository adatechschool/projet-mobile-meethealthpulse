//
//  FindFriends.swift
//  meet_health_pulse
//
//  Created by Mischael Phemius on 04/09/2023.
//

import SwiftUI
import Combine


struct FindFriendsView: View {
    
    @State var selectedActivity: String? = nil
    @State private var presented = false
    
    @State private var activity = ""
    @State private var location = ""
    @State private var maxDistance = ""
    @State private var minAge = ""
    @State private var maxAge = ""
    
    @State var task = ChooseActivities(name: "", servingActivities: [])
    @ObservedObject private var viewModel = AccountSettingsViewModel()
    
    
    
    var body: some View {
        
        NavigationView {
        //NavigationStack {
            VStack{
                
                Form {
                    Section(header: Text("Activity")) {
                        ActivityFieldView(presented: $presented, activity: $selectedActivity, value: $activity)
                        
                        /*MultiSelector(
                            label: Text("Choose activities"),
                            options: viewModel.activities,
                            optionToString: { $0.name },
                            selected: $task.servingActivities
                        )*/
                        
                    }
                    Section (header: Text ("Filtres de recherches")) {
                        //TextField("Activité", text: $activity)
                        
                        /*ActivityField(placeholder: "Choose an activity", presented: $presented, activity: $selectedActivity, value: $activity)*/
                        
                        TextField("Location", text: $location)
                        
                        HStack {
                            TextField("Distance maximale (km)", text: $maxDistance)
                            
                        }
                    }
                    
                    Section(header: Text("Filtres d'âge (0-122)")) {
                        HStack {
                            TextField("Age minimum", text: $minAge)
                                .keyboardType(.numberPad)
                                .onReceive(Just(minAge)){ newValue in
                                    let validAgeMin = newValue.filter { "0123456789".contains($0)}
                                    if validAgeMin != newValue {
                                        self.minAge = validAgeMin
                                    }
                                    if validAgeMin.count > 2 {
                                        self.minAge = String(validAgeMin.prefix(2))
                                    }
                                }
                            //Text("ans")
                        }
                        HStack {
                            TextField("Age maximum", text: $maxAge)
                                .keyboardType(.numberPad)
                                .onReceive(Just(maxAge)){ newValue in
                                    let validAgeMax = newValue.filter { "0123456789".contains($0)}
                                    if validAgeMax != newValue {
                                        self.maxAge = validAgeMax
                                    }
                                    if validAgeMax.count > 3 {
                                        self.maxAge = String(validAgeMax.prefix(3))
                                    }
                                    if let age = Int(maxAge), age >= 122 {
                                        self.maxAge = "122"
                                    }
                                }
                            //Text("ans")
                        }
                    }
                    
                }
                .navigationTitle("Find Friends")
                .navigationBarBackButtonHidden(true)
                .navigationBarTitleDisplayMode(.inline)
                
                /*Button(action: {
                    // Send to Database
                    // signUp.toggle()
                }, label: {
                    Text("Find")
                        .frame(width: 150,
                               height: 50,
                               alignment: .center)
                        .background(Color("Primary"))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                })*/
                NavigationLink(destination: FindFriendsResults(users: filterUsers(activity: selectedActivity ?? "", users: users)
                  
                )) {
                    Text("Find")
                        .frame(width: 150, height: 50, alignment: .center)
                        .background(Color("Primary"))
                        .foregroundColor(.white)
                        .cornerRadius(8)
                }
                .padding()
                
            }
        }
       
        
        }
        
    
    
    struct FindFriends_Previews: PreviewProvider {
        static var previews: some View {
            FindFriendsView()
        }
    }
}

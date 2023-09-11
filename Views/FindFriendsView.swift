//
//  FindFriends.swift
//  meet_health_pulse
//
//  Created by Mischael Phemius on 04/09/2023.
//

import SwiftUI

struct FindFriendsView: View {
    
    @State var selectedActivity: String? = nil
    @State private var presented = false
    
    @State private var activity = ""
    @State private var location = ""
    @State private var minDistance = ""
    @State private var maxDistance = ""
    @State private var minAge = ""
    @State private var maxAge = ""
    
    
    var body: some View {
        
            Form {
                Section (header: Text ("Filtres de recherches")) {
                    //TextField("Activité", text: $activity)
                    ActivityField(placeholder: "Choose an activity", presented: $presented, activity: $selectedActivity, value: $activity)
                    TextField("Location", text: $location)
                    
                    HStack {
                        TextField("Distance minimale (km)", text: $minDistance)
                        
                    }
                    HStack {
                        TextField("Distance maximale (km)", text: $maxDistance)
                        
                    }
                }
                
                Section(header: Text("Filtres d'âge")) {
                    HStack {
                        TextField("Age minimum", text: $minAge)
                        Text("ans")
                    }
                    HStack {
                        TextField("Age maximum", text: $maxAge)
                        Text("ans")
                    }
                }
                Button("Rechercher"){
                }
            }
            .activityPicker(presented: $presented, value: $activity)
        }
        
    
    
    struct FindFriends_Previews: PreviewProvider {
        static var previews: some View {
            FindFriendsView()
        }
    }
}

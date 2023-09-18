//
//  ActivityEditView.swift
//  meet_health_pulse
//
//  Created by pierre Jezequel on 18/09/2023.
//

import SwiftUI

struct ActivityEditView: View {
    @State var task = ChooseActivities(name: "", servingActivities: [])
    
    
    
    var body: some View {
        Form {
            Section(header: Text("Name")) {
                           TextField("e.g. Find a good Japanese textbook", text: $task.name)
                       }
            
            Section(
                //header: Text("Add a new Activity or Sport")
            ){
                // mock data:
                let allGoals: [Goal] = [
                    Goal(name: "Learn Japanese"),
                    Goal(name: "Learn SwiftUI"),
                    Goal(name: "Learn Serverless with Swift")
                ]
                
                Picker("Serving Goal", selection: $task.servingActivities){
                    ForEach(allGoals) {
                        Text($0.name).tag($0 as Goal)
                    }
                }.navigationTitle("Edit Task")            }
        }
        
    }
}

struct ActivityEditView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ActivityEditView()
        }
    }
}

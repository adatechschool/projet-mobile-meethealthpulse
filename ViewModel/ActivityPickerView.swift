//
//  ActivityPickerView.swift
//  meet_health_pulse
//
//  Created by pierre Jezequel on 11/09/2023.
//

import SwiftUI

struct ActivityPickerView: View {
    @Binding var presented: Bool
    @Binding var activity: String?
    @Binding var value: String
    
    var body: some View {
        NavigationView {
            List {
                ForEach(activities, id: \.self) { activityOption in
                    Button(action: {
                        activity = activityOption.name
                        value = activityOption.name
                        presented = false
                    }) {
                        ActivityRow(activity: activityOption)
                        
                    }
                }
            }
            .navigationBarTitle("Choose an activity", displayMode: .inline)
            .navigationBarItems(trailing: Button(action: { presented = false }) {
                Text("Done").bold()
            })
        }
    }
}


struct ActivityPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityPickerView(presented: .constant(true), activity: .constant("Football"), value: .constant("Football"))
    }
}

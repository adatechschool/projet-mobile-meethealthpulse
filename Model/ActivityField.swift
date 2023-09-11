//
//  ActivityField.swift
//  meet_health_pulse
//
//  Created by pierre Jezequel on 11/09/2023.
//

import SwiftUI

struct ActivityField: View {
    let placeholder: String
    @Binding var presented: Bool
    @Binding var activity: String?
    @Binding var value: String
    
    var body: some View {
        TextField(placeholder, text: $value, onEditingChanged: { value in
            presented = value
        })
            
    }
}

struct ActivityField_Previews: PreviewProvider {
    static var previews: some View {
        @State var activity: String? = nil
        @State var presented = false
        return ActivityField(placeholder: "Choose an activity", presented: $presented, activity: $activity, value: .constant(""))
            .padding()
        
    }
}

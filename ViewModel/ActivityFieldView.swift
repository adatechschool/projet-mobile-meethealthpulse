//
//  ActivityFieldView.swift
//  meet_health_pulse
//
//  Created by pierre Jezequel on 11/09/2023.
//

import SwiftUI
//import SwiftUISymbols

struct ActivityFieldView: View {
    @Binding var presented: Bool
    @Binding var activity: String?
    @Binding var value: String

    var body: some View {
        NavigationLink(destination: ActivityPickerView(presented: $presented, activity: $activity, value: $value), isActive: $presented) {
            
           
            
            VStack {
                Text(activity ?? "Choose an activity")
                    .foregroundColor(activity != nil ? .primary : .secondary)
                
            }
        }
        

        
    }
}
struct ActivityFieldView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
                    ActivityFieldView(presented: .constant(false), activity: .constant(nil), value: .constant(""))
                    ActivityFieldView(presented: .constant(true), activity: .constant("Football"), value: .constant("Football"))
                }
    }
}

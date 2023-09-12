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
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationView {
        //NavigationStack {
            List {
                ForEach(activities, id: \.self) { activityOption in
                    Button(action: {
                        activity = activityOption.name
                        value = activityOption.name
                        presented = false
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        ActivityRow(activity: activityOption)
                        
                    }
                }
            }
            .navigationBarTitle("Choose an activity", displayMode: .inline)
            .navigationBarBackButtonHidden(true)
            //.navigationBarHidden(false)
        }
        
    }
}


struct ActivityPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ActivityPickerView(presented: .constant(true), activity: .constant("Football"), value: .constant("Football"))
    }
}

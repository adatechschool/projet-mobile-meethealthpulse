//
//  Picker.swift
//  meet_health_pulse
//
//  Created by pierre Jezequel on 07/09/2023.
//

import SwiftUI

struct ActivityPicker: ViewModifier {
    
    @Binding var presented: Bool
    @Binding var value: String
    
    @State private var selection = 0
    
    func body(content: Content) -> some View {
        
        ZStack {
            content
            
            VStack {
                Spacer()
                
                VStack{
                    Picker("Choose activity", selection: $selection) {
                            Text("Football").tag(0)
                            Text("Course").tag(1)
                            Text("Natation").tag(2)
                            Text("Tennis").tag(3)
                }
                .frame(maxWidth: .infinity)
                .background(.white)
                .cornerRadius(15)
                .shadow(radius: 5)
                .offset(y: presented ? 0 : 250)
            }
        }
        .animation(.default, value: presented)
        .ignoresSafeArea()
            
        }
    }
}

extension View {
    func activityPicker(presented: Binding<Bool>, value: Binding<String>) -> some View {
        modifier(ActivityPicker(presented: presented, value: value))
    }
}

struct Picker_Previews: PreviewProvider {
    static var previews: some View {
        @State var presented = false
        @State var activity: String?
        @State var value = ""
        
        return ActivityField(placeholder: "Choose an activity", presented: $presented, activity: $activity, value: $value)
        
    }
}

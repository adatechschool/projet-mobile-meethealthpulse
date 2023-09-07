//
//  Picker.swift
//  meet_health_pulse
//
//  Created by pierre Jezequel on 07/09/2023.
//

import SwiftUI

struct ActivityPicker: View {
    
    @State private var selection = 0
    
    var body: some View {
            Picker("Choose activity", selection: $selection) {
                    Text("Football").tag(0)
                    Text("Course").tag(1)
                    Text("Natation").tag(2)
                    Text("Tennis").tag(3)
        }
    }
}

struct Picker_Previews: PreviewProvider {
    static var previews: some View {
        ActivityPicker()
    }
}

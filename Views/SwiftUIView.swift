//
//  SwiftUIView.swift
//  meet_health_pulse
//
//  Created by pierre Jezequel on 07/09/2023.
//

import SwiftUI

struct EditProfile : View {
    var dateFormatter: DateFormatter {
            let formatter = DateFormatter()
            formatter.dateStyle = .long
            return formatter
        }

        @State private var birthDate = Date()

        var body: some View {
            VStack {
                Text("Select a date")
                DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                    Text("date")
                        .font(.title)
                        .foregroundColor(.red)
                }
                
                Text("Birth date is \(birthDate, formatter: dateFormatter)")
            }.labelsHidden()
        }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfile()
    }
}

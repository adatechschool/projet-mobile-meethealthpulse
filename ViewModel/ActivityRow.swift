//
//  ActivityRow.swift
//  meet_health_pulse
//
//  Created by pierre Jezequel on 11/09/2023.
//

import SwiftUI

struct ActivityRow: View {
    var activity: Activity
    
    var body: some View {
        HStack {
            activity.image
                .resizable()
                .frame(width: 30, height: 30)
            Text(activity.name)
            
            Spacer()
        }
        .foregroundColor(Color.black)
        
    }
}

struct ActivityRow_Previews: PreviewProvider {
    static var previews: some View {
        
            ActivityRow(activity: activities[0])
        
    }
}

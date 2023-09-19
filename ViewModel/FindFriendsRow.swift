//
//  FindFriendsRow.swift
//  meet_health_pulse
//
//  Created by pierre Jezequel on 19/09/2023.
//

import SwiftUI

struct FindFriendsRow: View {
    var user: User
    
    var body: some View {
        VStack {
            Text(user.name )
            Text("like")
            Text(user.activity)
                .bold()
                .underline()
        }
    }
}

struct FindFriendsRow_Previews: PreviewProvider {
    static var previews: some View {
        FindFriendsRow(user: users[0])
    }
}

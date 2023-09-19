//
//  FindFriendsResults.swift
//  meet_health_pulse
//
//  Created by pierre Jezequel on 18/09/2023.
//

import SwiftUI

struct FindFriendsResults: View {
    
    let users: [User]

      var body: some View {
          if users.isEmpty {
              HStack {
                  Image(systemName: "person.2.slash")
                  Text("You are alone")
              }
              .foregroundColor(Color.red)
              .font(.system(size: 36))
              .bold()
              
          } else {
              
              VStack {
                  HStack {
                      Image(systemName: "face.smiling")
                      
                      if users.count == 1{
                          Text("You have \(users.count) person available")}
                      else {
                          Text("You have \(users.count) people available")
                      }
                          
                  }
                  .foregroundColor(Color.green)
                  
                  List(users) { user in
                      FindFriendsRow(user: user)
                  }
                  .onAppear {
                      print(users)
                  }
              }
              
          }
      }
  }

struct FindFriendsResults_Previews: PreviewProvider {
    static var previews: some View {
        FindFriendsResults(users: [])
        
    }
}

//
//  Users.swift
//  meet_health_pulse
//
//  Created by pierre Jezequel on 31/08/2023.
//

import Foundation

struct User: Hashable, Codable, Identifiable {
    var id: Int
    var name: String

    var activity: String
    
    
}

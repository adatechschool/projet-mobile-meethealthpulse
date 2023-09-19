//
//  filterUsers.swift
//  meet_health_pulse
//
//  Created by pierre Jezequel on 19/09/2023.
//

import Foundation

func filterUsers (activity: String, users: [User]) -> [User] {
    return users.filter {$0.activity == activity}
}

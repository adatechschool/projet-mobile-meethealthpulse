//
//  AccountSettingsViewModel.swift
//  meet_health_pulse
//
//  Created by pierre Jezequel on 18/09/2023.
//

import SwiftUI

class AccountSettingsViewModel: ObservableObject {
    @Published var activities: [Activity] = []

    init() {
        // Chargez les activités depuis le fichier JSON
        activities = load("activityData.json")
    }
}

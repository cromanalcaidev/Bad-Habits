//
//  BadHabits_Model.swift
//  Bad Habits
//
//  Created by Carlos Román Alcaide on 15/4/24.
//

import Foundation

struct Activity: Codable, Identifiable, Hashable, Equatable {
    var id = UUID()
    let activity: String
    let description: String
    let type: String
//    var timesUserDidIt: Int
}

@Observable
class Activities {
    var activityList = [Activity]() {
        didSet {
            save()
        }
    }
    
    private let savedActivities = URL.documentsDirectory.appending(path: "savedActivities")
    
    init() {
        if let data = try? Data(contentsOf: savedActivities) {
            if let decoded = try? JSONDecoder().decode([Activity].self, from: data) {
                activityList = decoded
                return
            }
        }
    }
    
    func save() {
        do {
            let data = try JSONEncoder().encode(activityList)
            try data.write(to: savedActivities)
        } catch {
            print("Failed to save your data")
        }
    }
}

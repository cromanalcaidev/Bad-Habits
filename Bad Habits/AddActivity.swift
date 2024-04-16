//
//  AddActivity.swift
//  Bad Habits
//
//  Created by Carlos Román Alcaide on 15/4/24.
//

import SwiftUI

struct AddActivity: View {
    @Environment(\.dismiss) var dismiss
    
    var activities: Activities
    
    @State private var activityName = ""
    @State private var activityDescription = ""
    @State private var type = "🤸‍♀️"
    var timesUserDidIt = 0
    
    var types = ["🎸", "🤸‍♀️", "🤓", "💼", "📚", "👩‍🍳", "🗺"]
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Add an activity", text: $activityName)
                TextField("Add a description", text: $activityDescription)
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) { type in
                        Text("\(type)")
                    }
                }
            }
            Button {
                let item = Activity(activity: activityName, description: activityDescription, type: type)
                activities.activityList.append(item)
                dismiss()
            } label: {
                Text("Add activy")
            }
        }
    }
}

#Preview {
    AddActivity(activities: Activities())
}

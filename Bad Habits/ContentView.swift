//
//  ContentView.swift
//  Bad Habits
//
//  Created by Carlos Román Alcaide on 15/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var activities = Activities()
    @State private var showAddActivity = false
    
    var body: some View {
        NavigationStack {
                List {
                    ForEach(activities.activityList) { activity in
                        HStack {
                            VStack {
                                Text("\(activity.activity)")
                                    .font(.title3)
                                    .frame(maxWidth: .infinity, alignment: .leading)


                                Text("\(activity.description)")
                                    .foregroundColor(.secondary)
                                    .frame(maxWidth: .infinity, alignment: .leading)
                            }
                            
                            Spacer()
                            
                            Text("\(activity.type)")
                                .font(.system(size: 30))
                                .frame(maxWidth: .infinity, alignment: .center)
                            
                            NavigationLink("", value: activity)
                            
                        }
                        .navigationDestination(for: Activity.self) { activity in
                            ActivityDetailView()
                            
                        }
                    }
                    .onDelete(perform: removeItems)
                }
                .navigationTitle("Bad Habits")
                .toolbarBackground(.blue)
                .toolbarColorScheme(.dark)
                .toolbar{
                    Button("New Activity", systemImage: "plus") {
                        showAddActivity = true
                    }
                }
                .sheet(isPresented: $showAddActivity) {
                    AddActivity(activities: activities)
            }
        }
    }
    func removeItems(at offsets: IndexSet) {
        activities.activityList.remove(atOffsets: offsets)
    }
}

#Preview {
    ContentView()
}

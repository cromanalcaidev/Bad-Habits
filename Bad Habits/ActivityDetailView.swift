//
//  ActivityDetailView.swift
//  Bad Habits
//
//  Created by Carlos Román Alcaide on 16/4/24.
//

import SwiftUI

struct ActivityDetailView: View {
    var activity = Activities()
    @State private var viewNumber = 0
    
    @State private var timesUserDidIt = 0
    
    var body: some View {
        
        
        VStack {
            VStack {
                Text("\(activity.activityList[viewNumber].type)")
                    .font(.system(size: 50))
                Text("\(activity.activityList[viewNumber].activity)")
                    .font(.system(size: 30))
                    .foregroundColor(.primary)
                Text("\(activity.activityList[viewNumber].description)")
                    .font(.system(size: 20))
                    .foregroundColor(.secondary)
            }
            .frame(width: 300)
            .padding()
            
            Divider()
                .overlay(.black)
                .padding()
                .frame(width: 300)
                
            
            if timesUserDidIt == 0 {Text("You haven't started practising \(activity.activityList[viewNumber].activity.lowercased()) yet.").frame(width: 300)}
            else if timesUserDidIt == 1 {Text("Congrats! You've practised \(activity.activityList[viewNumber].activity.lowercased()) for the first time!")}
            else if timesUserDidIt > 1 && timesUserDidIt < 10 {Text("Congrats! Now you've practised \(activity.activityList[viewNumber].activity.lowercased()) \(timesUserDidIt) times!")}
            else {Text("Wow, you're a master of \(activity.activityList[viewNumber].activity.lowercased())! You've done it \(timesUserDidIt) times!").frame(width: 300)}
            
            Button("Add a new entry") {
                timesUserDidIt += 1
            }
            .padding()
            .buttonStyle(.borderedProminent)
            .tint(.blue)
        }
        .frame(maxWidth: .infinity)
        .padding(.vertical, 20)
        .background(.regularMaterial)
        .clipShape(.rect(cornerRadius: 20))
        .padding()
    
    }
}

#Preview {
    ActivityDetailView()
}

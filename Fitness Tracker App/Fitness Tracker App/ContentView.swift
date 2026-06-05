//
//  ContentView.swift
//  Fitness Tracker App
//
//  Created by Z.K   on 04/06/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var entries: [(activity: String, calories: Int)] = []
    @State private var activity = ""
    @State private var calories = ""
    
    var totalCalories: Int {
        entries.reduce(0) { $0 + $1.calories }
    }
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.green, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text("Total Calories: \(totalCalories)")
                    .font(.title)
                    .foregroundColor(.white)
                
                TextField("Activity", text: $activity)
                    .textFieldStyle(.roundedBorder)
                TextField("Calories", text: $calories)
                    .keyboardType(.numberPad)
                    .textFieldStyle(.roundedBorder)
                
                Button("Add Entry") {
                    if let cal = Int(calories) {
                        entries.append((activity: activity, calories: cal))
                        activity = ""
                        calories = ""
                    }
                }
                .buttonStyle(.borderedProminent)
                .tint(.purple)
                
                List(entries, id: \.activity) { entry in
                    HStack {
                        Text(entry.activity)
                        Spacer()
                        Text("\(entry.calories) cal")
                    }
                }
                .frame(height: 200)
            }
            .padding()
        }
    }
}
#Preview {
    ContentView()
}

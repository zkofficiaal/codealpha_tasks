//
//  ContentView.swift
//  Random Quote Generator
//
//  Created by Z.K   on 04/06/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var quotes = [
        ("Stay hungry, stay foolish.", "Steve Jobs"),
        ("Code is like humor. When you have to explain it, it’s bad.", "Cory House")
    ]
    @State private var currentQuote: (String, String)? = nil
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.orange, .pink], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                if let quote = currentQuote {
                    Text("“\(quote.0)”")
                        .font(.title)
                        .multilineTextAlignment(.center)
                        .foregroundColor(.white)
                        .padding()
                    
                    Text("- \(quote.1)")
                        .font(.headline)
                        .foregroundColor(.white.opacity(0.8))
                } else {
                    Text("Tap New Quote")
                        .foregroundColor(.white)
                }
                
                Button("New Quote") {
                    currentQuote = quotes.randomElement()
                }
                .buttonStyle(.borderedProminent)
                .tint(.blue)
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

//
//  ContentView.swift
//  Flashcard Quiz App
//
//  Created by Z.K   on 04/06/2026.
//

import SwiftUI

struct ContentView: View {
    @State private var flashcards: [(question: String, answer: String)] = [
        ("What is SwiftUI?", "A declarative UI framework by Apple."),
        ("What is MVVM?", "Model-View-ViewModel architecture.")
    ]
    @State private var currentIndex = 0
    @State private var showAnswer = false
    
    var body: some View {
        ZStack {
            LinearGradient(colors: [.purple, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                Text(showAnswer ? flashcards[currentIndex].answer : flashcards[currentIndex].question)
                    .font(.title)
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity, minHeight: 200)
                    .background(RoundedRectangle(cornerRadius: 20).fill(Color.white.opacity(0.2)))
                    .shadow(radius: 10)
                    .onTapGesture { withAnimation { showAnswer.toggle() } }
                
                HStack {
                    Button("Previous") { if currentIndex > 0 { currentIndex -= 1; showAnswer = false } }
                    Button("Next") { if currentIndex < flashcards.count - 1 { currentIndex += 1; showAnswer = false } }
                }
                .buttonStyle(.borderedProminent)
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}

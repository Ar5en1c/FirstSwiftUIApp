//
//  example.swift
//  FirstSwiftUIApp
//
//  Created by Kuldeep Singh on 6/28/24.
//

import SwiftUI

struct LaunchScreen: View {
    var data: [Int] = Array(1...90)
    @State private var isTextVisible = false
    @State private var navigateToNextScreen = false
    @State private var rotation = 0.0
    
    var body: some View {
        NavigationStack {
            ZStack{
                backgroundView(data: data)
                VStack{
                    if isTextVisible {
                        Text("Welcome to ChecklistApp")
                            .font(.title.bold())
                            .padding()
                            .foregroundColor(.white)
                            .background(Color.black.opacity(0.6))
                            .cornerRadius(15)
                            .transition(.opacity)
                            .animation(.easeInOut(duration: 3.0), value: 9.0)
                        
                    }
                }
            }
            .onAppear {
                withAnimation {
                    self.isTextVisible = true
                }
                DispatchQueue.main.asyncAfter(deadline: .now() + 3.0) {
                    self.navigateToNextScreen = true
                }
            }
            .navigationTitle("")
            .navigationBarHidden(true)
            .navigationDestination(isPresented: $navigateToNextScreen) {
                ChecklistApp()
            }
            
        }
    }
    
    func backgroundView(data: [Int]) -> some View{
        HStack{
            ForEach(data.indices, id: \.self) { index in
                HStack{
                    Circle()
                        .trim(from: 0.5, to: 1.0)
                        .frame(width: CGFloat(index)*2)
                        .foregroundColor(.red)
                        .scaleEffect(1 + CGFloat(index) * 0.1)
                        .animation(.easeIn(duration: 2), value: 10)
                        .rotationEffect(.degrees(rotation))
                    Spacer()
                    Circle()
                        .trim(from: 0.3, to: 1.0)
                        .frame(width: CGFloat(index+1)*2)
                        .foregroundColor(.green)
                        .scaleEffect(1 + CGFloat(index+1) * 0.1)
                        .animation(.easeIn(duration: 2), value: 10)
//                        .rotationEffect(.degrees(rotation + 60))
                    Spacer()
                    Circle()
                        .trim(from: 0.27, to: 1.0)
                        .frame(width: CGFloat(index+2)*2)
                        .foregroundColor(.blue)
                        .scaleEffect(1 + CGFloat(index+2) * 0.1)
                        .animation(.easeIn(duration: 2), value: 10)
//                        .rotationEffect(.degrees(rotation + 120))
                }
                .rotationEffect(.degrees(CGFloat(index)), anchor: .center)
            }
        }
        .onAppear {
            withAnimation(Animation.easeInOut(duration: 3.0).repeatCount(1)) {
                rotation = 360.0
            }
        }
    }
}

#Preview {
    LaunchScreen()
}

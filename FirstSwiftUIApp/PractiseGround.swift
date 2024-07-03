//
//  PractiseGround.swift
//  FirstSwiftUIApp
//
//  Created by Kuldeep Singh on 7/2/24.
//

import SwiftUI

struct PractiseGround: View {
    @State private var rotation = 0.0
    
    var body: some View {
        ZStack{
            Circle()
                .trim(from: 0.5, to: 1.0)
                .rotationEffect(.degrees(rotation))
            Circle()
                .trim(from: 0.5, to: 1.0)
//                .fill(.red)
                .rotationEffect(.degrees(rotation + 180.0))
            Ellipse()
                .fill(.white)
                .frame(width: 200, height: 100, alignment: .center)
                .rotationEffect(.degrees(rotation + 60.0))
                .shadow(color: .white, radius: 20)
        }.onAppear {
            withAnimation(Animation.easeInOut(duration: 3.0).repeatForever(autoreverses: true)) {
                rotation = 360.0
            }
        }
    }
}

#Preview {
    PractiseGround()
}

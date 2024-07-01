//
//  ContentView.swift
//  FirstSwiftUIApp
//
//  Created by Kuldeep Singh on 6/27/24.
//

import SwiftUI


struct ContentView: View {
    @State private var colorsGrid: [[Color]] = [
            [.blue, .red, .yellow],
            [.blue, .red, .yellow],
            [.blue, .red, .yellow]
        ]
    let colorsArr: [Color] = [.blue, .red, .yellow, .green, .orange, .pink, .black]
    
    
    var body: some View {
        HStack{
            ForEach(0..<3) { i in
                Spacer()
                VStack(alignment: .center){
                    ForEach(0..<3) { j in
                        Spacer()
                        ZStack{
                            Circle()
                                .fill(colorsGrid[i][j])
                                .onTapGesture {
                                    let randomInt = Int.random(in: 0..<7)
                                    colorsGrid[i][j] = colorsArr[randomInt]
                                }
                                
                            Text("Swift-UI")
                                .foregroundColor(.white)
                                .fontWeight(.heavy)
                                .padding()
                                
                                
                        }
                        Spacer()
                        }
                    }
                Spacer()
            }
        }
    }
    

//    let data: [String] = ["Kuldeep","Singh","Ponia"]
//    let colorsArr: [Color] = [.blue, .red, .yellow]
//    
//    var body: some View {
//        HStack {
//            VStack{
//                    ForEach(data.indices) { index in
//                        ZStack{
//                            Rectangle()
//                                .frame(width: 300, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
//                                .foregroundColor(colorsArr[index])
//                            Text("\(index): \(data[index])")
//                                .foregroundColor(.white)
//                                .font(.system(size: 24))
//                        }
//                        .cornerRadius(10)
//                        .padding(5)
//                    }
//                }
//        }
//        .padding()
//    }
}

#Preview {
    ContentView()
}

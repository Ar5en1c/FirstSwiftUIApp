//
//  AddRemoveItemView.swift
//  FirstSwiftUIApp
//
//  Created by Kuldeep Singh on 6/28/24.
//

import SwiftUI

struct AddRemoveItemView: View {
    @State var numRows: Int = 0
    @State private var colorsSetter: [Color] = [.blue, .red, .yellow, .green, .orange, .pink, .black]
    let colorsArr: [Color] = [.blue, .red, .yellow, .green, .orange, .pink, .black]
    
    var body: some View {
        VStack{
            HStack{
                Spacer()
                Button(action: { self.numRows += 1}, 
                       label: { Text("+")})
                .frame(width: 40, height: 40)
                .font(.title)
                .background(Color.white)
                .clipShape(Circle())
                .shadow(radius: 20)
                Spacer()
                
                ScrollView{
                    VStack {
                        ForEach(0..<numRows, id: \.self) { i in
                            Spacer()
                            ZStack{
                                Circle()
                                    .fill(colorsSetter[i%7])
                                    .frame(width: 100, height: 100, alignment: .center)
                                    .onTapGesture {
                                        let randomInt = Int.random(in: 0..<7)
                                        colorsSetter[i] = colorsArr[randomInt]
                                    }
                                Text("Swift-UI")
                                    .foregroundColor(.white)
                                    .fontWeight(.heavy)
                                    .padding()
                            }
                            Spacer()
                        }
                    }
                }
                .padding()
                
                Spacer()
                Button(action: { if (self.numRows>0){ self.numRows -= 1}}, 
                       label: { Text("-")})
                .frame(width: 40, height: 40, alignment: .center)
                .font(.title)
                .background(Color.white)
                .clipShape(Circle())
                .shadow(radius: 10)
                Spacer()
            }
            
            
        }
    }
}

#Preview {
    AddRemoveItemView()
}

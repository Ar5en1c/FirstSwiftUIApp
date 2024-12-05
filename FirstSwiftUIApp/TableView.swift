//
//  TableView.swift
//  FirstSwiftUIApp
//
//  Created by Kuldeep Singh on 7/2/24.
//

import SwiftUI

struct TableView: View {
    
    var data: [Int] = Array(1...100)
    @State private var selectedIndices: Set<Int> = []
    @State private var showingColors: Bool = false
    
    var body: some View {
        NavigationStack{
            ZStack{
                if self.showingColors {
                    LaunchScreen().backgroundView(data: Array(1...70))
                        .ignoresSafeArea()
                        .frame(height: 0)
                }
            }
            List{
                ForEach(data.indices, id: \.self) { index in
                    ZStack{
                        HStack {
                            Text(self.selectedIndices.contains(index) ? "Hello selected \(index+1)" : "\(self.data[index])")
                                .foregroundColor(.black)
                                .frame(height:40)
                            Spacer()
                        }
                        .padding(.vertical, 5)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .cornerRadius(5)
                        .contentShape(Rectangle())
                    }
                    .listRowBackground(self.backgroundChanger(for: index, isSelected: self.selectedIndices.contains(index)))
                    .onTapGesture {
                        if self.selectedIndices.contains(index) {
                            self.selectedIndices.remove(index)
                        } else {
                            self.selectedIndices.insert(index)
                        }
                    }
                }
            }
            .navigationTitle("Numbers 1 to 100")
            .toolbar {
                HStack{
                    Button(action: { self.showingColors.toggle() }, label: {
                        Text("Color Mode")})
                    .padding(5)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 10)
                    
                    Spacer()
                    
                    Button(action: { self.selectedIndices.removeAll(); self.showingColors = false }, label: { Text("Reset")} )
                    .padding(5)
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 10)
                }
            }
        }
    }
    
    func backgroundChanger(for index: Int, isSelected: Bool) -> some View {
        if isSelected {
            if (self.data[index] % 2 == 0) && (self.data[index] % 5 == 0) {
                return Color.red
            } else if self.data[index] % 2 == 0 {
                return Color.yellow
            } else if self.data[index] % 5 == 0 {
                return Color.blue
            }
        } else if self.showingColors {
            if (self.data[index] % 2 == 0) && (self.data[index] % 5 == 0) {
                return Color.red
            } else if self.data[index] % 2 == 0 {
                return Color.yellow
            } else if self.data[index] % 5 == 0 {
                return Color.blue
            }
        }
        
        return Color.clear
    }
}

#Preview {
    TableView()
}

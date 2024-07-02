//
//  TableView.swift
//  FirstSwiftUIApp
//
//  Created by Kuldeep Singh on 7/2/24.
//

import SwiftUI

struct TableView: View {
    
    var data: [Int] = Array(0...100)
    @State private var selectedIndices: Set<Int> = []
    
    var body: some View {
        NavigationStack{
            List{
                ForEach(data.indices, id: \.self) { index in
                    Button(action: {
                        if self.selectedIndices.contains(index) {
                            self.selectedIndices.remove(index)
                        } else {
                            self.selectedIndices.insert(index)
                        }
                    }) {
                        Text(self.selectedIndices.contains(index) ? "Hello selected \(index)" : "\(self.data[index])")
                    }
                }.navigationTitle("Numbers 1 to 100")
            }
        }
    }
}

#Preview {
    TableView()
}

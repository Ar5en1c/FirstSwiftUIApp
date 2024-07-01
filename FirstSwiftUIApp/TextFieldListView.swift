//
//  TextFieldListView.swift
//  FirstSwiftUIApp
//
//  Created by Kuldeep Singh on 7/1/24.
//

import SwiftUI

struct TextFieldListView: View {
    var data: [(placeholder: String, iconName: String)] = [
            ("Name", "person.fill"),
            ("Age", "person.fill"),
            ("Phone", "phone.fill"),
            ("Email", "envelope.fill"),
            ("Address", "house.fill"),
            ("Pincode", "building.2.fill"),
            ("City", "building.2.fill"),
            ("State", "building.2.fill"),
            ("Country", "map.fill"),
            ("Password", "lock.fill")
        ]
    @State var dummyText: String = ""
    
    var body: some View {
        NavigationView {
            List{
                ForEach(data.indices, id: \.self) { index in
                    HStack{
                        Image(systemName: self.data[index].iconName)
                        TextField("\(self.data[index].placeholder)...", text: $dummyText)
                    }
                    .padding()
                    .background(Color.gray.opacity(0.2))
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                }
            }
            .navigationTitle("User Details")
        }
    }
}

#Preview {
    TextFieldListView()
}

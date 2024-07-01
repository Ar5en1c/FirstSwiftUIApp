//
//  ListView.swift
//  FirstSwiftUIApp
//
//  Created by Kuldeep Singh on 6/28/24.
//
import SwiftUI

struct Food {
    var name: String
    var icon: String
    var isFavorite: Bool
}

var foods = [Food(name: "Apple", icon: "🍎", isFavorite: true),
                 Food(name: "Banana", icon: "🍌", isFavorite: false),
                 Food(name: "Cherry", icon: "🍒", isFavorite: false),
                 Food(name: "Mango", icon: "🥭", isFavorite: true),
                 Food(name: "Kiwi", icon: "🥝", isFavorite: false),
                 Food(name: "Strawberry", icon: "🍓", isFavorite: false),
                 Food(name: "Grapes", icon: "🍇", isFavorite: true)
         ]

struct ListView: View {
    
    @State private var foodsList = foods

    var body: some View {
        VStack {
            HStack{
                Button( action: {self.foodsList.append(contentsOf: foods)}, label: {
                    Text("Add Items")
                })
                .frame(width: 100, height: 40, alignment: .center)
                .background(Color.blue)
                .cornerRadius(10)
                .foregroundColor(.white)
                
                Spacer()
                
                Button( action: {let removeCount = min(self.foodsList.count, 6)
                    self.foodsList.removeLast(removeCount)},
                        label: { Text("Remove Items")
                })
                .frame(width: 120, height: 40, alignment: .center)
                .background(Color.blue)
                .cornerRadius(10)
                .foregroundColor(.white)
            }
            .padding()
            
            List{
                Section(header: Text("Fruits List").bold()){
                    ForEach(foodsList.indices, id: \.self) { index in
                        let food = foodsList[index]
                        HStack{
                            Text(food.icon)
                            Text(food.name)
                            Spacer()
                            Image(systemName: food.isFavorite ? "heart.fill" : "heart")
                                .onTapGesture {
                                    foodsList[index].isFavorite.toggle()
                                }
                        }
                    }
                }
            }
        }}
}

#Preview {
    ListView()
}

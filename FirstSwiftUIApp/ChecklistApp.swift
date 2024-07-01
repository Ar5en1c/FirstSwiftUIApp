//
//  ChecklistApp.swift
//  FirstSwiftUIApp
//
//  Created by Kuldeep Singh on 6/30/24.
//
//Problem :- create a dummy model and show that data on a table view in swift ui and create a expandable and collapsing table view

import SwiftUI

struct ChecklistItem: Identifiable {
    let id = UUID()
    var name: String
    var isChecked: Bool
}

struct Checklist: Identifiable {
    let id = UUID()
    var name: String
    var items: [ChecklistItem]
    var isExpanded: Bool = false
}

struct ChecklistApp: View {
    @State private var checklists: [Checklist] = [
        Checklist(name: "Grocery List",items: [
            ChecklistItem(name: "Apples", isChecked: false),
            ChecklistItem(name: "Milk", isChecked: true)
        ], isExpanded: false)
    ]

    @State private var newChecklistName = ""
    @State private var newItemName = ""
    @State private var isAddingNewChecklist = false

    var body: some View {
        NavigationView {
            List {
                ForEach(checklists.indices, id: \.self) { index in
                    Section(header: headerView(for: index)) {
                        if self.checklists[index].isExpanded {
                            ForEach(self.checklists[index].items) { item in
                                HStack{
                                    Text(item.name)
                                    Spacer()
                                    Button(action:{
                                        toggleItemChecked(checklistIndex: index, itemId: item.id)
                                    }) {
                                        Image(systemName: item.isChecked ? "checkmark.square.fill" : "square")
                                    }
                                }
                            }
                            addItemView(for: index)
                        }
                    }
                }
                if isAddingNewChecklist {
                    NewChecklistView(isPresented: $isAddingNewChecklist, checklists: $checklists)
                }
            }
            .navigationBarTitle("ChecklistApp")
            .toolbar {
                    HStack{
                        Button(action: {isAddingNewChecklist = true})
                        {
                            Image(systemName: "plus").padding().bold()
                        }
                        Spacer()
                        Button(action: {
                            if let index = checklists.firstIndex(where: { $0.isExpanded }) {
                                deleteChecklist(for: index)
                            }
                        })
                        {
                            Image(systemName: "xmark.bin").padding().bold()
                        }
                    }
            }
        }
    }
    
    func headerView(for index: Int) -> some View{
        HStack{
                Text(self.checklists[index].name)
                    .bold()
                    .padding()
                    .frame(width: 300, alignment: .leading)
                    .background(Color.white)
                Spacer()
                Image(systemName: self.checklists[index].isExpanded ? "chevron.up" : "chevron.down")
                    .padding()
        }
        .background(Color.white)
        .clipShape(RoundedRectangle(cornerRadius: 10))
        .onTapGesture {
            withAnimation {
                self.checklists[index].isExpanded.toggle()}
        }
    }
    
    func addItemView(for index: Int) -> some View {
        HStack {
            TextField("Add item...", text: $newItemName)
            Spacer()
            Button(action: {
                addItemToChecklist(checklistIndex: index)
            }) {
                Image(systemName: "plus.circle.fill")
            }
        }.padding(.vertical)
    }
    
    func toggleIsExanded(checklistIndex: Int){
        self.checklists[checklistIndex].isExpanded.toggle()
    }
    
    func toggleItemChecked(checklistIndex: Int, itemId: UUID) {
        if let itemIndex = checklists[checklistIndex].items.firstIndex(where: { $0.id == itemId }) {
            checklists[checklistIndex].items[itemIndex].isChecked.toggle()
        }
    }

    func addNewChecklist(for index: Int) {
        let newChecklist = Checklist(name: newChecklistName, items: [])
        checklists.append(newChecklist)
    }
    
    func deleteChecklist(for index: Int) {
        checklists.remove(at: index)
    }

    func addItemToChecklist(checklistIndex: Int) {
        if !newItemName.isEmpty {
            let newItem = ChecklistItem(name: newItemName, isChecked: false)
            checklists[checklistIndex].items.append(newItem)
            newItemName = ""
        }
    }
}

struct NewChecklistView: View {
    @Binding var isPresented: Bool
    @Binding var checklists: [Checklist]
    @State private var newChecklistName = ""

    var body: some View {
        HStack {
            TextField("New Checklist", text: $newChecklistName)

            Button(action: {
                if newChecklistName != "" {
                    checklists.append(Checklist(name: newChecklistName, items: []))
                    newChecklistName = ""
                    isPresented = false
                }}) {
                Text("Add")
            }
        }
        .padding()
    }
}


#Preview {
    ChecklistApp()
}

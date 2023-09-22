//
//  ToDoListView.swift
//  ToDoList-SwiftData
//
//  Created by Steven Yung on 9/21/23.
//

import SwiftUI
import SwiftData

struct ToDoListView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var toDoList: [ToDo]
    
    @State private var inAddMode = false

    var body: some View {
        NavigationStack {
            List {
                ForEach(toDoList) { toDo in
                    HStack {
                        // check box code will be here
                        NavigationLink {
                            ToDoDetailView(toDo: toDo)
                        } label: {
                            Text(toDo.item)
                        }
                    }
                    .font(.title2)
                }
            }
            .navigationTitle("To Do List")
            .navigationBarTitleDisplayMode(.automatic)
            .listStyle(.plain)
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        inAddMode.toggle()
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            .sheet(isPresented: $inAddMode){
                NavigationStack {
                    // passing in nil for add mode
                    ToDoDetailView(toDo: nil)
                }
            }
        }
    }

}

#Preview {
    ToDoListView()
        .modelContainer(for: ToDo.self, inMemory: true)
}

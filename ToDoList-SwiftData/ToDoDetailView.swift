//
//  ToDoDetailView.swift
//  ToDoList-SwiftData
//
//  Created by Steven Yung on 9/21/23.
//

import SwiftUI
import SwiftData

struct ToDoDetailView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.modelContext) var modelContext
    
    // passing in ToDo, can be nill for new ToDo
    let toDo: ToDo?
    
    // setting up title and create info to be displayed
    private var viewTitle: String { // will be in navigation bar
        toDo == nil ? "Add New To Do" : "Edit To Do"
    }
    private var createInfo: String {    // show timestamp if Edit mode
        toDo == nil ? "" : "Created: \(String(describing: toDo?.timestamp))"
    }
    
    // local ToDo info
    @State private var item = ""
    @State private var reminderIsOn = false
    @State private var dueDate = Date.now + (60*60*24*7) // default is +7 days
    @State private var notes = ""
    @State private var isCompleted = false
    
    var body: some View {
        List {
            TextField("To Do Name", text: $item)
                .font(.title)
                .textFieldStyle(.roundedBorder)
                .padding(.vertical)
                .listRowSeparator(.hidden)
            
            Toggle("Set Reminder", isOn: $reminderIsOn)
                .padding(.top)
                .listRowSeparator(.hidden)
            
            DatePicker("DueDate", selection: $dueDate)
                .listRowSeparator(.hidden)
            
            Text("Notes:")
                .padding(.top)
            TextField("Type any notes here", text: $notes, axis: .vertical)
                .textFieldStyle(.roundedBorder)
                .listRowSeparator(.hidden)
            
            Toggle("Completed", isOn: $isCompleted)
                .listRowSeparator(.hidden)
            
            Text(createInfo)
                .font(.caption)
                .listSectionSeparator(.hidden)
        }
        .listStyle(.plain)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text(viewTitle)
            }
            ToolbarItem(placement: .cancellationAction) {
                Button("Cancel") {
                    dismiss()
                }
            }
            ToolbarItem(placement: .confirmationAction) {
                Button("Save") {
                    withAnimation {
                        saveToDo()
                        dismiss()
                    }
                }
                .disabled(item == "")
            }
        }
        .onAppear {
            if let toDo {
                // toDo exist, set the local variables
                item = toDo.item
                reminderIsOn = toDo.reminderIsOn
                dueDate = toDo.dueDate
                notes = toDo.notes
                isCompleted = toDo.isCompleted
            }
        }
        .navigationBarBackButtonHidden()
        .navigationBarTitleDisplayMode(.inline)
    }
    
    private func saveToDo() {
        if let toDo {
            // update the persistent data with the local private data
            toDo.item = item
            toDo.reminderIsOn = reminderIsOn
            toDo.dueDate = dueDate
            toDo.notes = notes
            toDo.isCompleted = isCompleted
            // not updated timestamp
        } else {
            // add new ToDo
            let newToDo = ToDo(timestamp: Date.now, item: item, reminderIsOn: reminderIsOn, dueDate: dueDate, notes: notes, isCompleted: isCompleted)
            modelContext.insert(newToDo)
        }
    }
}

#Preview {
    ToDoDetailView(toDo: nil)
        .modelContainer(for: ToDo.self)
}

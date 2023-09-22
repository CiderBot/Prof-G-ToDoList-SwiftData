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
    
    // passing in ToDo, can be nill for new ToDo
    let toDo: ToDo?
    
    // setting up title and create info
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
                        //To-Do: add save stuff here
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
}

#Preview {
    ToDoDetailView(toDo: nil)
}

//
//  AddTaskSheet.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//


import SwiftUI

struct AddTaskSheet: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var priority: Task.Priority = .medium
    @State private var category: Task.Category = .personal
    @State private var hasDueDate: Bool = false
    @State private var dueDate: Date = Date().addingTimeInterval(86400)
    @State private var isFavorite: Bool = false
    
    var onSave: (Task) -> Void
    
    // MARK: - Computed Properties
    
    private var isSaveDisabled: Bool {
        title.isEmpty
    }
    
    private var previewTitle: String {
        title.isEmpty ? "New task" : title
    }
    
    private var previewDescription: String? {
        description.isEmpty ? nil : description
    }
    
    private var previewDueDate: Date? {
        hasDueDate ? dueDate : nil
    }
    
    private var dueDateFooterText: String {
        "You'll be reminded: \(dueDate.formatted(date: .abbreviated, time: .shortened))"
    }
    
    // MARK: - Body
    
    var body: some View {
        NavigationStack {
            Form {
                basicInfoSection
                prioritySection
                categorySection
                dueDateSection
                additionalOptionsSection
                previewSection
            }
            .navigationTitle("New Task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button(role: .destructive) {
                        dismiss()
                    } label: {
                        Label("Confirm", systemImage: "xmark")
                    }
                }
                
            }
            .confirmButton(action: saveTask, isDisabled: isSaveDisabled)
            .interactiveDismissDisabled(!title.isEmpty)
        }
    }
    
    // MARK: - Sections
    
    private var basicInfoSection: some View {
        Section {
            TextField("Title", text: $title)
                .formLabel()
            
            TextField("Description (optional)", text: $description, axis: .vertical)
                .formLabel()
                .lineLimit(3...6)
        } header: {
            Label("Basic Information", systemImage: "info.circle")
        }
    }
    
    private var prioritySection: some View {
        Section {
            Picker("Priority", selection: $priority) {
                ForEach(Task.Priority.allCases, id: \.self) { priority in
                    HStack {
                        Text(priority.rawValue)
                        Spacer()
                        Circle()
                            .fill(Color.priorityColor(for: priority))
                            .frame(width: ToDoConstants.iconSize, height: ToDoConstants.iconSize)
                    }
                    .tag(priority)
                }
            }
            .pickerStyle(.menu)
        } header: {
            Label("Priority", systemImage: "exclamationmark.circle")
        } footer: {
            Text("Select the importance of this task")
                .formFooter()
        }
    }
    
    private var categorySection: some View {
        Section {
            Picker("Category", selection: $category) {
                ForEach(Task.Category.allCases, id: \.self) { category in
                    Label(category.rawValue, systemImage: category.icon)
                        .tag(category)
                }
            }
            .pickerStyle(.menu)
        } header: {
            Label("Category", systemImage: "folder")
        } footer: {
            Text("Organize your task into a category")
                .formFooter()
        }
    }
    
    private var dueDateSection: some View {
        Section {
            Toggle(isOn: $hasDueDate) {
                Label("Set due date", systemImage: "calendar")
            }
            .tint(.accentColor)
            
            if hasDueDate {
                DatePicker(
                    "Due date",
                    selection: $dueDate,
                    in: Date()...,
                    displayedComponents: [.date, .hourAndMinute]
                )
                .datePickerStyle(.graphical)
                .labelsHidden()
            }
        } header: {
            Label("Due Date", systemImage: "clock")
        } footer: {
            if hasDueDate {
                HStack(spacing: ToDoConstants.smallSpacing) {
                    Image(systemName: "calendar.badge.clock")
                        .smallIcon()
                    Text(dueDateFooterText)
                }
                .formFooter()
            }
        }
    }
    
    private var additionalOptionsSection: some View {
        Section {
            Toggle(isOn: $isFavorite) {
                Label("Mark as favorite", systemImage: isFavorite ? "star.fill" : "star")
            }
            .tint(.yellow)
        } header: {
            Label("Additional Options", systemImage: "star.circle")
        }
    }
    
    private var previewSection: some View {
        Section {
            TaskPreviewCard(
                title: previewTitle,
                description: previewDescription,
                priority: priority,
                category: category,
                dueDate: previewDueDate,
                isFavorite: isFavorite
            )
        } header: {
            Label("Preview", systemImage: "eye")
        }
    }
    
    // MARK: - Actions (Only calling dismiss and callback)
    
    private func saveTask() {
        guard !title.isEmpty else { return }
        
        let newTask = Task(
            title: title,
            description: description.isEmpty ? nil : description,
            isCompleted: false,
            isFavorite: isFavorite,
            priority: priority,
            dueDate: hasDueDate ? dueDate : nil,
            category: category
        )
        
        onSave(newTask)
        dismiss()
    }
}

#Preview("Empty Form") {
    AddTaskSheet { task in
        print("New task: \(task.title)")
    }
}

 

//
//  Task.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//


import Foundation

// MARK: - Task Model

struct Task: Identifiable {
    let id = UUID()
    var title: String
    var description: String?
    var isCompleted: Bool
    var isFavorite: Bool
    var priority: Priority
    var dueDate: Date?
    var category: Category
    
    enum Priority: String, CaseIterable {
        case high = "High"
        case medium = "Medium"
        case low = "Low"
    }
    
    enum Category: String, CaseIterable {
        case personal = "Personal"
        case work = "Work"
        case shopping = "Shopping"
        case health = "Health"
        case other = "Other"
        
        var icon: String {
            switch self {
            case .personal: return "person.fill"
            case .work: return "briefcase.fill"
            case .shopping: return "cart.fill"
            case .health: return "heart.fill"
            case .other: return "folder.fill"
            }
        }
    }
    
    // MARK: - Computed Properties
    
    var isOverdue: Bool {
        guard let dueDate = dueDate, !isCompleted else { return false }
        return dueDate < Date()
    }
    
    var hasDescription: Bool {
        description != nil && !(description?.isEmpty ?? true)
    }
}

// MARK: - Sample Data

extension Task {
    static let sampleTasks: [Task] = [
        Task(
            title: "Team Meeting",
            description: "Discuss Q4 project progress",
            isCompleted: false,
            isFavorite: true,
            priority: .high,
            dueDate: Date().addingTimeInterval(86400),
            category: .work
        ),
        Task(
            title: "Buy Groceries",
            description: "Milk, bread, fruits and vegetables",
            isCompleted: false,
            isFavorite: false,
            priority: .medium,
            dueDate: Date().addingTimeInterval(3600),
            category: .shopping
        ),
        Task(
            title: "Exercise",
            description: "30 minutes of cardio",
            isCompleted: true,
            isFavorite: true,
            priority: .medium,
            dueDate: Date(),
            category: .health
        ),
        Task(
            title: "Check Emails",
            description: nil,
            isCompleted: true,
            isFavorite: false,
            priority: .low,
            dueDate: Date().addingTimeInterval(-3600),
            category: .work
        ),
        Task(
            title: "Call Dentist",
            description: "Schedule checkup appointment",
            isCompleted: false,
            isFavorite: false,
            priority: .high,
            dueDate: Date().addingTimeInterval(172800),
            category: .health
        ),
        Task(
            title: "Read Book",
            description: "Continue with 'Atomic Habits'",
            isCompleted: false,
            isFavorite: true,
            priority: .low,
            dueDate: nil,
            category: .personal
        ),
        Task(
            title: "Prepare Presentation",
            description: "Slides for Friday meeting",
            isCompleted: false,
            isFavorite: false,
            priority: .high,
            dueDate: Date().addingTimeInterval(259200),
            category: .work
        ),
        Task(
            title: "Pay Bills",
            description: "Electricity and water",
            isCompleted: false,
            isFavorite: false,
            priority: .medium,
            dueDate: Date().addingTimeInterval(432000),
            category: .personal
        )
    ]
    
    static var sample: Task {
        sampleTasks[0]
    }
    
    static var completedSample: Task {
        sampleTasks[2]
    }
    
    static var overdueSample: Task {
        Task(
            title: "Overdue Task",
            description: "This task is overdue",
            isCompleted: false,
            isFavorite: false,
            priority: .high,
            dueDate: Date().addingTimeInterval(-86400),
            category: .work
        )
    }
}

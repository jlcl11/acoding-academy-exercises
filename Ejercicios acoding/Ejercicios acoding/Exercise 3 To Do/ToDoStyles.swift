//
//  ToDoConstants.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 17/11/25.
//


import SwiftUI

// MARK: - Constants

struct ToDoConstants {
    // Corner Radius
    static let buttonCornerRadius: CGFloat = 10
    static let badgeCornerRadius: CGFloat = 12
    static let cardCornerRadius: CGFloat = 12
    
    // Padding
    static let horizontalPadding: CGFloat = 16
    static let verticalPadding: CGFloat = 10
    static let sectionPadding: CGFloat = 16
    static let cardPadding: CGFloat = 12
    
    // Spacing
    static let iconSpacing: CGFloat = 6
    static let sectionSpacing: CGFloat = 12
    static let elementSpacing: CGFloat = 8
    static let smallSpacing: CGFloat = 4
    
    // Sizes
    static let iconSize: CGFloat = 12
    static let largeIconSize: CGFloat = 60
    static let badgePaddingHorizontal: CGFloat = 8
    static let badgePaddingVertical: CGFloat = 3
}

// MARK: - Text Styles

struct TitleTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
            .fontWeight(.medium)
    }
}

struct SubtitleTextStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundStyle(.secondary)
    }
}

struct SectionHeaderStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundStyle(.secondary)
    }
}

struct EmptyStateTitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title2)
            .fontWeight(.semibold)
    }
}

struct EmptyStateSubtitleStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .foregroundStyle(.secondary)
            .multilineTextAlignment(.center)
    }
}

struct FormLabelStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.body)
    }
}

struct FormFooterStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundStyle(.secondary)
    }
}

// MARK: - Button Styles

struct FilterButtonStyle: ViewModifier {
    let isSelected: Bool
    
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.semibold)
            .padding(.horizontal, ToDoConstants.horizontalPadding)
            .padding(.vertical, ToDoConstants.verticalPadding)
            .frame(maxWidth: .infinity)
            .background(isSelected ? Color.accentColor : Color(.systemGray6))
            .foregroundStyle(isSelected ? .white : .primary)
            .clipShape(RoundedRectangle(cornerRadius: ToDoConstants.buttonCornerRadius))
    }
}

struct SecondaryButtonStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.subheadline)
            .fontWeight(.medium)
            .padding(.horizontal, ToDoConstants.horizontalPadding)
            .padding(.vertical, ToDoConstants.verticalPadding)
            .frame(maxWidth: .infinity)
            .background(Color(.systemGray6))
            .foregroundStyle(.primary)
            .clipShape(RoundedRectangle(cornerRadius: ToDoConstants.buttonCornerRadius))
    }
}

struct CompletionButtonStyle: ViewModifier {
    let isCompleted: Bool
    
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .foregroundStyle(isCompleted ? .green : .secondary)
    }
}

// MARK: - Badge Styles

struct PriorityBadgeStyle: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.caption2)
            .fontWeight(.semibold)
            .padding(.horizontal, ToDoConstants.badgePaddingHorizontal)
            .padding(.vertical, ToDoConstants.badgePaddingVertical)
            .background(color.opacity(0.2))
            .foregroundStyle(color)
            .clipShape(Capsule())
    }
}

struct CategoryBadgeStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption2)
            .padding(.horizontal, ToDoConstants.badgePaddingHorizontal)
            .padding(.vertical, ToDoConstants.badgePaddingVertical)
            .background(Color(.systemGray5))
            .foregroundStyle(.secondary)
            .clipShape(Capsule())
    }
}

// MARK: - Icon Styles

struct TaskIconStyle: ViewModifier {
    let color: Color
    
    func body(content: Content) -> some View {
        content
            .font(.title3)
            .foregroundStyle(color)
    }
}

struct SmallIconStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption2)
    }
}

struct EmptyStateIconStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: ToDoConstants.largeIconSize))
            .foregroundStyle(.tertiary)
    }
}

struct FavoriteIconStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundStyle(.yellow)
    }
}

struct CategoryIconStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.caption)
            .foregroundStyle(.secondary)
    }
}

// MARK: - Container Styles

struct TaskRowContainerStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, ToDoConstants.smallSpacing)
            .contentShape(Rectangle())
    }
}

struct EmptyStateContainerStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .padding()
    }
}

struct FilterButtonsContainerStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .padding(.top, 8)
            .padding(.bottom, 12)
    }
}

struct ActionButtonsContainerStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal)
            .padding(.vertical, 12)
    }
}

struct PreviewCardContainerStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.vertical, ToDoConstants.smallSpacing)
    }
}

// MARK: - Text Decoration Styles

struct StrikethroughTextStyle: ViewModifier {
    let isActive: Bool
    
    func body(content: Content) -> some View {
        content
            .strikethrough(isActive, color: .secondary)
            .foregroundStyle(isActive ? .secondary : .primary)
    }
}

struct OverdueTextStyle: ViewModifier {
    let isOverdue: Bool
    
    func body(content: Content) -> some View {
        content
            .foregroundStyle(isOverdue ? .red : .secondary)
    }
}

// MARK: - Toolbar Styles

fileprivate struct ConfirmButton: ViewModifier {
    let action: () -> Void

    func body(content: Content) -> some View {
        content
            .toolbar {
                ToolbarItem {
                    if #available(iOS 26.0, *) {
                        Button(role: .confirm) {
                            action()
                        } label: {
                            Label("Confirm", systemImage: "checkmark")
                        }
                    } else {
                        Button {
                            action()
                        } label: {
                            Label("Confirm", systemImage: "checkmark")
                        }
                    }
                }
            }
    }
}
// MARK: - View Extensions

extension View {
    // Text styles
    func titleText() -> some View {
        modifier(TitleTextStyle())
    }
    
    func subtitleText() -> some View {
        modifier(SubtitleTextStyle())
    }
    
    func sectionHeader() -> some View {
        modifier(SectionHeaderStyle())
    }
    
    func emptyStateTitle() -> some View {
        modifier(EmptyStateTitleStyle())
    }
    
    func emptyStateSubtitle() -> some View {
        modifier(EmptyStateSubtitleStyle())
    }
    
    func formLabel() -> some View {
        modifier(FormLabelStyle())
    }
    
    func formFooter() -> some View {
        modifier(FormFooterStyle())
    }
    
    // Button styles
    func filterButton(isSelected: Bool) -> some View {
        modifier(FilterButtonStyle(isSelected: isSelected))
    }
    
    func secondaryButton() -> some View {
        modifier(SecondaryButtonStyle())
    }
    
    func completionButton(isCompleted: Bool) -> some View {
        modifier(CompletionButtonStyle(isCompleted: isCompleted))
    }
    
    // Badge styles
    func priorityBadge(color: Color) -> some View {
        modifier(PriorityBadgeStyle(color: color))
    }
    
    func categoryBadge() -> some View {
        modifier(CategoryBadgeStyle())
    }
    
    // Icon styles
    func taskIcon(color: Color = .secondary) -> some View {
        modifier(TaskIconStyle(color: color))
    }
    
    func smallIcon() -> some View {
        modifier(SmallIconStyle())
    }
    
    func emptyStateIcon() -> some View {
        modifier(EmptyStateIconStyle())
    }
    
    func favoriteIcon() -> some View {
        modifier(FavoriteIconStyle())
    }
    
    func categoryIcon() -> some View {
        modifier(CategoryIconStyle())
    }
    
    // Container styles
    func taskRowContainer() -> some View {
        modifier(TaskRowContainerStyle())
    }
    
    func emptyStateContainer() -> some View {
        modifier(EmptyStateContainerStyle())
    }
    
    func filterButtonsContainer() -> some View {
        modifier(FilterButtonsContainerStyle())
    }
    
    func actionButtonsContainer() -> some View {
        modifier(ActionButtonsContainerStyle())
    }
    
    func previewCardContainer() -> some View {
        modifier(PreviewCardContainerStyle())
    }
    
    // Text decoration styles
    func strikethroughText(isActive: Bool) -> some View {
        modifier(StrikethroughTextStyle(isActive: isActive))
    }
    
    func overdueText(isOverdue: Bool) -> some View {
        modifier(OverdueTextStyle(isOverdue: isOverdue))
    }
    
    // Toolbar
    func confirmButton(action: @escaping () -> Void, isDisabled: Bool = false) -> some View {
        modifier(ConfirmButton(action: action))
    }
}

// MARK: - Color Extensions

extension Color {
    static func priorityColor(for priority: Task.Priority) -> Color {
        switch priority {
        case .high: return .red
        case .medium: return .orange
        case .low: return .blue
        }
    }
}

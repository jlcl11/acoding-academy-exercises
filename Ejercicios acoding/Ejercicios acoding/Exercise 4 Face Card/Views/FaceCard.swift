//
//  FaceCard.swift
//  Ejercicios acoding
//
//  Created by José Luis Corral López on 18/11/25.
//

import SwiftUI

// MARK: - Text Styles
struct PrimaryTextStyle: ViewModifier {
    let size: CGFloat
    let weight: Font.Weight
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight))
            .foregroundStyle(.primary)
    }
}

struct SecondaryTextStyle: ViewModifier {
    let size: CGFloat
    let weight: Font.Weight
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight))
            .foregroundStyle(.secondary)
    }
}

struct WhiteTextStyleFC: ViewModifier {
    let size: CGFloat
    let weight: Font.Weight
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight))
            .foregroundStyle(.white)
    }
}

// MARK: - Card Styles
struct GlassCardStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(.thinMaterial, in: RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}

struct ChipStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(.thinMaterial, in: Capsule())
    }
}

// MARK: - View Extensions
extension View {
    func primaryText(size: CGFloat, weight: Font.Weight = .regular) -> some View {
        modifier(PrimaryTextStyle(size: size, weight: weight))
    }
    
    func secondaryText(size: CGFloat, weight: Font.Weight = .regular) -> some View {
        modifier(SecondaryTextStyle(size: size, weight: weight))
    }
    
    func whiteTextFC(size: CGFloat, weight: Font.Weight = .regular) -> some View {
        modifier(WhiteTextStyleFC(size: size, weight: weight))
    }
    
    func glassCard() -> some View {
        modifier(GlassCardStyle())
    }
    
    func chip() -> some View {
        modifier(ChipStyle())
    }
}
import Foundation

struct Person: Identifiable, Hashable {
    let id: UUID = UUID()
    let name: String
    let age: Int
    let bio: String
    let occupation: String
    let location: String
    let company: String
    let education: String
    let height: String
    let imageResource: ImageResource
    let interests: [String]
    let distance: Int
}

import Foundation

extension Person {
    static let example = Person(
        name: "José Luis",
        age: 22,
        bio: "Coffee lover and sunset chaser. Always looking for new adventures and good conversations.",
        occupation: "App Manager",
        location: "Málaga",
        company: "Coffee King",
        education: "Apple Coding Academy",
        height: "6'0\"",
        imageResource: .selfie,
        interests: ["Videogames", "Travel", "Yoga", "Coding"],
        distance: 3
    )
}
import SwiftUI

struct InterestChip: View {
    let interest: String
    
    var body: some View {
        Text(interest)
            .secondaryText(size: 14, weight: .medium)
            .chip()
    }
}

struct InterestGrid: View {
    let interests: [String]
    
    var body: some View {
        FlowLayout(spacing: 8) {
            ForEach(interests, id: \.self) { interest in
                InterestChip(interest: interest)
            }
        }
    }
}

struct FlowLayout: Layout {
    var spacing: CGFloat = 8
    
    func sizeThatFits(proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) -> CGSize {
        let result = arrangeSubviews(proposal: proposal, subviews: subviews)
        return result.size
    }
    
    func placeSubviews(in bounds: CGRect, proposal: ProposedViewSize, subviews: Subviews, cache: inout ()) {
        let result = arrangeSubviews(proposal: proposal, subviews: subviews)
        for (index, subview) in subviews.enumerated() {
            subview.place(at: CGPoint(x: bounds.minX + result.positions[index].x,
                                     y: bounds.minY + result.positions[index].y),
                         proposal: .unspecified)
        }
    }
    
    private func arrangeSubviews(proposal: ProposedViewSize, subviews: Subviews) -> (size: CGSize, positions: [CGPoint]) {
        var positions: [CGPoint] = []
        var currentX: CGFloat = 0
        var currentY: CGFloat = 0
        var maxHeight: CGFloat = 0
        var totalWidth: CGFloat = 0
        
        let width = proposal.width ?? .infinity
        
        for subview in subviews {
            let size = subview.sizeThatFits(.unspecified)
            
            if currentX + size.width > width && currentX > 0 {
                currentX = 0
                currentY += maxHeight + spacing
                maxHeight = 0
            }
            
            positions.append(CGPoint(x: currentX, y: currentY))
            currentX += size.width + spacing
            maxHeight = max(maxHeight, size.height)
            totalWidth = max(totalWidth, currentX - spacing)
        }
        
        let totalHeight = currentY + maxHeight
        return (CGSize(width: totalWidth, height: totalHeight), positions)
    }
}
import SwiftUI

struct ProfileInfoRow: View {
    let icon: String
    let label: String
    let value: String
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: icon)
                .secondaryText(size: 18, weight: .regular)
                .frame(width: 24)
            
            VStack(alignment: .leading, spacing: 2) {
                Text(label)
                    .secondaryText(size: 13, weight: .regular)
                
                Text(value)
                    .primaryText(size: 16, weight: .medium)
            }
            
            Spacer()
        }
        .padding(.vertical, 4)
    }
}

import SwiftUI

struct ProfileHeader: View {
    let person: Person
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(person.imageResource)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 500)
                .clipped()
                .overlay {
                    LinearGradient(
                        colors: [.clear, .clear, .black.opacity(0.7)],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                }
            
            VStack(alignment: .leading, spacing: 4) {
                HStack(spacing: 8) {
                    Text(person.name)
                        .whiteTextFC(size: 34, weight: .bold)
                    
                    Text("\(person.age)")
                        .whiteTextFC(size: 34, weight: .bold)
                    
                }
                
                InterestGrid(interests: person.interests)
                
                HStack(spacing: 4) {
                    Image(systemName: "location.fill")
                        .font(.caption)
                    
                    Text("\(person.location) • \(person.distance) km away")
                        .whiteTextFC(size: 15, weight: .regular)
                }
            }
            .shadow(radius: 3)
            .padding(20)
        }
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
    }
}
import SwiftUI

struct ProfileDetail: View {
    let person: Person
    
    var body: some View {
        ScrollView {
            VStack(spacing: 24) {
                ProfileHeader(person: person)
                   
                
                VStack(alignment: .leading, spacing: 20) {
                    AboutSection(bio: person.bio)
                    
                    Divider()
                    
                    InfoSection(person: person)
           
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 32)
            }
        }
        .scrollIndicators(.hidden)
        .background(Color(.systemGroupedBackground))
    }
}

struct AboutSection: View {
    let bio: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text("About")
                .primaryText(size: 20, weight: .semibold)
            
            Text(bio)
                .secondaryText(size: 16, weight: .regular)
                .lineSpacing(4)
        }
    }
}

struct InfoSection: View {
    let person: Person
    
    var body: some View {
        VStack(spacing: 12) {
            ProfileInfoRow(
                icon: "briefcase.fill",
                label: "Occupation",
                value: person.occupation
            )
            
            ProfileInfoRow(
                icon: "building.2.fill",
                label: "Company",
                value: person.company
            )
            
            ProfileInfoRow(
                icon: "graduationcap.fill",
                label: "Education",
                value: person.education
            )
            
            ProfileInfoRow(
                icon: "ruler.fill",
                label: "Height",
                value: person.height
            )
        }
    }
}


import SwiftUI

struct FaceCardView: View {
    let person: Person
    
    var body: some View {
       
            ProfileDetail(person: person)
            .ignoresSafeArea()
       
    }
}

#Preview {
    FaceCardView(person: .example)
}
 

 
import SwiftUI

struct FaceCard: View {
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
        .ignoresSafeArea()
        .background(Color(.systemGroupedBackground))
    }
}

#Preview {
    FaceCard(person: .example)
}
 

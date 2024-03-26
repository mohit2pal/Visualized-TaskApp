import SwiftUI

struct CardView: View {
    @Binding var reminderList: ReminderList
    @State private var linkIsActive = false
    
    var body: some View {
        Button {
            linkIsActive = true
            print(reminderList)
        } label: {
            VStack(alignment: .leading, spacing: 5) {
                HStack {
                    listIcon
                    Spacer()
                    // Changes Needed Haere
                    Text("\(reminderList.reminders.count)")
                        .font(.system(.title, design: .rounded, weight: .bold))
                        .padding(.trailing)
                    
                    
                }
                // Changes Needed Here
                Text(reminderList.name)
                    .font(.system(.body, design: .rounded, weight: .bold))
                    .foregroundColor(.secondary)
                
                
            }
            .padding(5)
            .padding(.horizontal, 5)
            .background(Color(UIColor.tertiarySystemFill))
            .cornerRadius(10)
        }
        .overlay(
            NavigationLink(
                isActive: $linkIsActive,
                destination: { ListView(reminderList: $reminderList) },
                label: { EmptyView() }
            ).opacity(0)
        )
        .buttonStyle(.plain)
        
    }
    
    var listIcon: some View {
        ZStack {
            Circle()
                .fill(reminderList.color)
                .frame(width: 27)
            Image(systemName: reminderList.iconName)
                .font(.footnote)
                .foregroundColor(.white)
                .bold()
        }
    }
}

#Preview {
    CardView(reminderList: .constant(ReminderList.example))
}

import SwiftUI

struct MyListRow: View {
    let reminderList: ReminderList
    var body: some View {
        HStack {
            listIcon
            Text(reminderList.name)
            Spacer()
            Text("\(reminderList.reminders.count)")
        }
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

#Preview{
    MyListRow(reminderList: ReminderList.example)
}

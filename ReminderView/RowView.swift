import SwiftUI

struct RowView: View {
    @Binding var reminder: ReminderModel
    let color: Color
    var body: some View {
        HStack {
            Button {
                reminder.isComplete.toggle()
            } label: {
                if reminder.isComplete {
                    filledReminderLabel
                } else {
                    emptyReminderLabel
                }
            }
            .frame(width: 20, height: 20)
            TextField(reminder.name, text: $reminder.name)
                .foregroundColor(reminder.isComplete ? .secondary : .primary)
            Text(reminder.priorityString)
                .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)

        }
    }
    
    var filledReminderLabel: some View {
        Circle()
            .stroke(color, lineWidth: 2)
            .overlay(alignment: .center) {
                GeometryReader { geo in
                    VStack {
                        Circle() // sized based on first
                            .fill(color)
                            .frame(width: geo.size.width*0.7, height: geo.size.height*0.7, alignment: .center)
                    }
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                    
                }
                
                
            }
    }
    
    var emptyReminderLabel: some View {
        Circle()
            .stroke(.secondary)
        
    }
}

#Preview{
    RowView(reminder: .constant(ReminderModel.example), color: .blue)
}

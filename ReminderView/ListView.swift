import SwiftUI

struct ListView: View {
    @Binding var reminderList: ReminderList
    
    enum Priority: String, CaseIterable {
        case high = "High"
        case medium = "Medium"
        case low = "Low"
    }
    
    @State var selectedPriority: Priority = .low
    
    var body : some View {
        
        VStack(alignment: .leading, spacing: 5){
            HStack{
                Text(reminderList.name)
                Spacer()
                Text("\(reminderList.reminders.count)")
            }
            .font(.system(.largeTitle,design: .rounded))
            .bold()
            .foregroundColor(reminderList.color)
            .padding(.horizontal)
            
            List{
                ForEach($reminderList.reminders) {
                    $reminder in RowView(reminder: $reminder, color: reminderList.color)
                }
                .onDelete(perform: delete)
            }
            .listStyle(.inset)
        }
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                VStack {
                    HStack {
                        Button{
                            reminderList.reminders.append(ReminderModel(name: "", priorityString: "\(selectedPriority)"))
                            print(type(of: selectedPriority))
                        } label: {
                            HStack(spacing: 7){
                                Image(systemName: "plus.circle.fill")
                                Text("New Remainder")
                            }
                            .font(.system(.body, design: .rounded))
                            .bold()
                            .foregroundColor(reminderList.color)
                            
                        }
                        Picker("Priority", selection: $selectedPriority) {
                            ForEach(Priority.allCases, id: \.self) { priority in
                                Text(priority.rawValue)
                            }
                        }
                        .pickerStyle(SegmentedPickerStyle())
                        .padding(.horizontal)
                        
                        Spacer()
                    }
                }
            }
            
        }
        .padding(.all)
    }
    func delete(at offsets: IndexSet) {
        reminderList.reminders.remove(atOffsets: offsets)
    }
}

#Preview {
    NavigationStack {
        ListView(reminderList: .constant(ReminderList.example))
    }
}

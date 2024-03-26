import SwiftUI


struct HomeView: View {
    @State var reminderLists = ReminderList.exampleLists
    @State var exampleToday = ReminderList.exampleToday
    @State var exampleScheduled = ReminderList.exampleScheduled
    @State var exampleFlagged = ReminderList.exampleFlagged
    
    var body: some View {
        NavigationStack {
            VStack {
                List {
                    Section {
                        VStack {
                            HStack {
                              CardView(reminderList: $exampleToday)
                              CardView(reminderList: $exampleScheduled)
                            }
                            HStack {
                                CardView(reminderList: .constant(allReminders))
                               CardView(reminderList: $exampleFlagged)
                            }
                        }
                    }
                    .listRowBackground(Color(UIColor.systemGroupedBackground))
                    .listRowInsets(EdgeInsets())
                    
                    Section {
                        ForEach($reminderLists){ $reminders in 
                        NavigationLink {
                            ListView(reminderList: $reminders)
                        } label: {
                            MyListRow(reminderList: reminders)
                        }}
                    } header: {
                        Text("My Lists")
                            .font(.system(.title3, design: .rounded, weight: .bold))
                            .foregroundColor(.primary)
                    }
                    
                    Section {
                        VStack {
                            HStack {
                                CardView(reminderList: .constant(allComplete))
                                CardView(reminderList: .constant(didnotComplete))
                            }
                            HStack {
                                CardView(reminderList: .constant(highPriority))
                                CardView(reminderList: .constant(mediumPriority))
                                CardView(reminderList: .constant(lowPriority))
                            }
                        }
                    } header: {
                        Text("All Tasks")
                             .font(.system(.title3, design: .rounded, weight: .bold))
                             .foregroundColor(.primary)
                             .padding(.horizontal)
                             .padding(.bottom, 5)
                    }
                    .listRowBackground(Color(UIColor.systemGroupedBackground))
                    .listRowInsets(EdgeInsets())
                }
            }
            .navigationTitle("Reminders")
        }
    }
    
    var allReminders: ReminderList {
        var allReminders = [ReminderModel]()
        for reminderList in reminderLists {
            for reminder in reminderList.reminders {
                allReminders.append(reminder)
            }
        }
        return ReminderList(name: "All", reminders: allReminders, color: .gray, iconName: "tray.fill")
    }
    
    var allComplete: ReminderList {
        var allComplete = [ReminderModel]()
        for reminderList in reminderLists {
            for reminder in reminderList.reminders {
                if reminder.isComplete == true {
                    allComplete.append(reminder)
                }
            }
        }
        return ReminderList(name: "Done", reminders: allComplete, color: .green, iconName: "checkmark.circle.fill")
    }
    
    var didnotComplete: ReminderList {
        var notComplete = [ReminderModel]()
        for reminderList in reminderLists {
            for reminder in reminderList.reminders {
                if reminder.isComplete == false {
                    notComplete.append(reminder)
                }
            }
        }
        return ReminderList(name: "Not Done", reminders: notComplete, color: .red, iconName: "checkmark.circle.badge.xmark")
    }
    
    var highPriority: ReminderList {
        var highPriority = [ReminderModel]()
        for reminderList in reminderLists {
            for reminder in reminderList.reminders {
                if reminder.priorityString == "High" {
                    highPriority.append(reminder)
                }
            }
        }
        return ReminderList(name: "High   Priority", reminders: highPriority, color: .orange, iconName: "exclamationmark.circle.fill")
    }
    
    var mediumPriority: ReminderList {
        var mediumPriority = [ReminderModel]()
        for reminderList in reminderLists {
            for reminder in reminderList.reminders {
                if reminder.priorityString == "Medium" {
                    mediumPriority.append(reminder)
                }
            }
        }
        return ReminderList(name: "Medium  Priority", reminders: mediumPriority, color: .yellow, iconName: "exclamationmark.circle")
    }
    
    var lowPriority: ReminderList {
        var lowPriority = [ReminderModel]()
        for reminderList in reminderLists {
            for reminder in reminderList.reminders {
                if reminder.priorityString == "Low" {
                    lowPriority.append(reminder)
                }
            }
        }
        return ReminderList(name: "Low     Priority", reminders: lowPriority, color: .green, iconName: "minus.circle")
    }
    
}

#Preview {
    HomeView()
}

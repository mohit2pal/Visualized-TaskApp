import Foundation
import SwiftUI

struct ReminderList: Identifiable {
    let id = UUID()
    var name: String
    var reminders = [ReminderModel]()
    var color = Color.blue
    var iconName = "list.bullet"
}

extension ReminderList {
    static var example: ReminderList {
        ReminderList(name: "Example list", reminders: [ReminderModel.example])
    }
    
    static var exampleLists: [ReminderList] {
        var out = [ReminderList]()
        out.append(ReminderList(name: "Reminders", reminders: [ReminderModel(name: "Walk dog", priorityString: "Low"), ReminderModel(name: "Take out trash", priorityString: "Medium")]))
        out.append(ReminderList(name: "Homework", reminders: [ReminderModel(name: "Chemistry pre-lab", priorityString: "High"), ReminderModel(name: "Linear algebra", priorityString: "Low")], color: .red, iconName: "graduationcap"))
        out.append(ReminderList(name: "App Team", reminders: [ReminderModel(name: "Talk to Sam", priorityString: "Medium"), ReminderModel(name: "Collect bounty", priorityString: "High")], color: .green, iconName: "iphone.homebutton"))
        out.append(ReminderList(name: "Urgent", reminders: [ReminderModel(name: "Watch movie with Noah", priorityString: "Medium"), ReminderModel(name: "Eat lunch with Bob", priorityString: "Medium")], color: .purple, iconName: "exclamationmark.3"))
        return out
    }
    
    static var exampleToday: ReminderList {
        ReminderList(name: "Today", reminders: [ReminderModel(name:"Walk the dog", priorityString: "High")], color: .blue, iconName: "sun.max.fill")
    }
    
    static var exampleScheduled: ReminderList {
        ReminderList(name: "Scheduled", reminders: [ReminderModel(name:"Lunch with Janet", priorityString: "Medium")], color: .red, iconName: "calendar")
    }
    
    static var exampleFlagged: ReminderList {
        ReminderList(name: "Flagged", reminders: [], color: .yellow, iconName: "flag.fill")
    }
    
}

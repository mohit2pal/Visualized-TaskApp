import SwiftUI

import Foundation

struct ReminderModel: Identifiable {
    let id = UUID()
    var name: String
    var isComplete = false
    var priorityString: String
}

extension ReminderModel {
    static var example: ReminderModel {
        ReminderModel(name: "Example reminder", priorityString: "low")
    }
}

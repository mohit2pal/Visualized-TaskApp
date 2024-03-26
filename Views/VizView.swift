import SwiftUI
import Charts

struct VizView: View {
    @State var reminderLists = ReminderList.exampleLists

    var body: some View {
        
        @State var mostPriorityList = mostPriority
        
        NavigationStack {
            VStack {
                List {
                    Section{
                        NavigationLink {
                            ListView(reminderList: .constant(mostPriority))
                        } label: {
                            MyListRow(reminderList: mostPriority)
                        }}
                    
                    Section{
                        VStack(alignment: .center){
                            Chart {
                                ForEach(pieData) { points in
                                    SectorMark(angle: .value("Section", points.reminderListName.count))
                                        .foregroundStyle(by: .value("Section", points.reminderListName))
                                }
                            }
                            .padding(.all)
                        }
                    }
                    HStack { 
                        Section{
                            ZStack{
                                Ring(lineWidth: 10, backgroundColor: .blue.opacity(0.2), foregroundColor: Color.blue, percentage: 30)
                                Text("2")
                                    .font(.system(.title, design: .rounded, weight: .bold))
                            }
                            .frame(width: 100, height: 130)
                        }
                        .padding(.horizontal)
                        
                        Section{
                            VStack (alignment: .leading)
                            {
                                Group {
                                    Text("Total Points Gained : 20")
                                    Text("Total Task Completed : 2")
                                }
                                .font(.system(.caption, design: .rounded, weight: .bold))
                                .foregroundColor(.primary)
                            }
                        }
                    }
                }
                .navigationTitle("Vizualization")
            }
        }
    }
    
    var mostPriority : ReminderList {
        var mostPriority = [ReminderModel]()
        for reminderList in reminderLists {
            for reminder in reminderList.reminders {
                if reminder.priorityString == "High" {
                    mostPriority.append(reminder)
                }
            }
        }
        return ReminderList(name: "Focused Tasks", reminders: mostPriority, color: .purple, iconName: "bolt.fill")
    }
    
    
    
    var pieData: [PieModel] {
        var arr = [PieModel]()
        for reminderList in reminderLists {
            for reminder in reminderList.reminders {
                arr.append(PieModel(reminderListName: reminderList.name, reminderName: reminder.name))
            }
        }
        print(arr)
        return arr
    }
    
}

#Preview {
    VizView()
}

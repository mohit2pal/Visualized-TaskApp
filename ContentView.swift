import SwiftUI

struct ContentView: View {
    @State var showSplitSheet: Bool = true
    
    var body: some View {
        TabView{
            HomeView()
                .tabItem { 
                    Label("Reminders", systemImage: "timer.circle")
                }
            VizView()
                .tabItem {
                    Label("Vizualization", systemImage: "chart.pie")
                }
        }
        .sheet(isPresented: $showSplitSheet, content: {
            SplitScreen(isPresented: $showSplitSheet)
        })
    }
}

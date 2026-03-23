import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = BeautyTrackerViewModel()
    
    var body: some View {
        
        TabView {
            
            HomeView(viewModel: viewModel)
                .tabItem {
                    Label("Главная", systemImage: "house")
                }
            
            
            ProceduresView(viewModel: viewModel)
                .tabItem {
                    Label("Процедуры", systemImage: "checklist")
                }
            
            
            CalendarView(viewModel: viewModel)
                .tabItem {
                    Label("Календарь", systemImage: "calendar")
                }
            
            
            CosmeticsView(viewModel: viewModel)
                .tabItem {
                    Label("Косметика", systemImage: "bag")
                }
            
            
            StatisticsView(viewModel: viewModel)
                .tabItem {
                    Label("Статистика", systemImage: "chart.bar")
                }
        }
    }
}

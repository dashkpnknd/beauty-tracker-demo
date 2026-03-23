import SwiftUI

struct StatisticsView: View {
    
    @ObservedObject var viewModel: BeautyTrackerViewModel
    
    var body: some View {
        
        NavigationView {
            
            VStack(spacing: 20) {
                
                statisticsCard(
                    title: "Всего процедур",
                    value: viewModel.procedures.count
                )
                
                statisticsCard(
                    title: "Выполнено",
                    value: viewModel.procedures.filter { $0.isCompleted }.count
                )
                
                statisticsCard(
                    title: "Запланировано",
                    value: viewModel.procedures.filter { !$0.isCompleted }.count
                )
                
                statisticsCard(
                    title: "Средств в списке",
                    value: viewModel.cosmetics.count
                )
                
                Spacer()
            }
            .padding()
            .navigationTitle("Статистика")
        }
    }
    
    
    func statisticsCard(title: String, value: Int) -> some View {
        
        VStack(spacing: 8) {
            
            Text(title)
                .font(.headline)
            
            Text("\(value)")
                .font(.largeTitle)
                .fontWeight(.bold)
        }
        .frame(maxWidth: .infinity)
        .padding()
        .background(Color.gray.opacity(0.15))
        .cornerRadius(12)
    }
}

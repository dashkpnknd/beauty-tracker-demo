import SwiftUI

struct HomeView: View {
    
    @ObservedObject var viewModel: BeautyTrackerViewModel
    
    var body: some View {
        
        NavigationView {
            
            ScrollView {
                
                VStack(spacing: 20) {
                    
                    Text("Beauty Tracker")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    
                    homeCard(
                        title: "Процедур всего",
                        value: "\(viewModel.procedures.count)"
                    )
                    
                    homeCard(
                        title: "Выполнено",
                        value: "\(viewModel.procedures.filter { $0.isCompleted }.count)"
                    )
                    
                    homeCard(
                        title: "Косметики в списке",
                        value: "\(viewModel.cosmetics.count)"
                    )
                    
                    homeCard(
                        title: "Запланировано",
                        value: "\(viewModel.procedures.filter { !$0.isCompleted }.count)"
                    )
                }
                .padding()
            }
            .navigationTitle("Главная")
        }
    }
    
    
    func homeCard(title: String, value: String) -> some View {
        
        HStack {
            
            VStack(alignment: .leading, spacing: 6) {
                
                Text(title)
                    .font(.headline)
                
                Text(value)
                    .font(.title2)
                    .fontWeight(.bold)
            }
            
            Spacer()
        }
        .padding()
        .background(Color.gray.opacity(0.15))
        .cornerRadius(12)
    }
}

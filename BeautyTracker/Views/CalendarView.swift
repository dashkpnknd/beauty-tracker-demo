import SwiftUI

struct CalendarView: View {
    
    @ObservedObject var viewModel: BeautyTrackerViewModel
    
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                ForEach(viewModel.procedures) { procedure in
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 4) {
                            
                            Text(procedure.title)
                                .font(.headline)
                            
                            Text(procedure.date.formatted(date: .long, time: .omitted))
                                .font(.subheadline)
                                .foregroundColor(.gray)
                        }
                        
                        Spacer()
                        
                        Text(procedure.isCompleted ? "Выполнено" : "Запланировано")
                            .font(.caption)
                            .padding(6)
                            .background(procedure.isCompleted ? Color.green.opacity(0.2) : Color.blue.opacity(0.2))
                            .cornerRadius(6)
                    }
                }
            }
            
            .navigationTitle("Календарь")
        }
    }
}

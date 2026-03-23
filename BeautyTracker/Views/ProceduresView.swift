import SwiftUI

struct ProceduresView: View {
    
    @ObservedObject var viewModel: BeautyTrackerViewModel
    
    @State private var isShowingAddScreen = false
    
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                ForEach(viewModel.procedures) { procedure in
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 5) {
                            
                            Text(procedure.title)
                                .font(.headline)
                            
                            Text(procedure.category)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Text(procedure.date.formatted(date: .abbreviated, time: .omitted))
                                .font(.caption)
                        }
                        
                        Spacer()
                        
                        Button {
                            viewModel.toggleProcedureCompletion(for: procedure)
                        } label: {
                            Image(systemName: procedure.isCompleted ? "checkmark.circle.fill" : "circle")
                                .font(.title2)
                        }
                        .buttonStyle(.plain)
                    }
                }
                .onDelete(perform: viewModel.deleteProcedure)
            }
            
            
            .navigationTitle("Процедуры")
            
            
            .toolbar {
                
                ToolbarItem(placement: .confirmationAction) {
                    
                    Button {
                        isShowingAddScreen = true
                    } label: {
                        Image(systemName: "plus")
                    }
                }
            }
            
            
            .sheet(isPresented: $isShowingAddScreen) {
                AddProcedureView(viewModel: viewModel)
            }
        }
    }
}

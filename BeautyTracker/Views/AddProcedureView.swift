import SwiftUI

struct AddProcedureView: View {
    
    @ObservedObject var viewModel: BeautyTrackerViewModel
    
    @Environment(\.dismiss) var dismiss
    
    
    @State private var title = ""
    @State private var category = ""
    @State private var date = Date()
    @State private var notes = ""
    
    
    var body: some View {
        
        NavigationView {
            
            Form {
                
                Section(header: Text("Процедура")) {
                    
                    TextField("Название", text: $title)
                    
                    TextField("Категория", text: $category)
                    
                    DatePicker("Дата", selection: $date, displayedComponents: .date)
                }
                
                
                Section(header: Text("Заметки")) {
                    
                    TextField("Комментарий", text: $notes)
                }
            }
            
            
            .navigationTitle("Новая процедура")
            
            
            .toolbar {
                
                ToolbarItem(placement: .cancellationAction) {
                    
                    Button("Отмена") {
                        dismiss()
                    }
                }
                
                
                ToolbarItem(placement: .confirmationAction) {
                    
                    Button("Сохранить") {
                        saveProcedure()
                    }
                }
            }
        }
    }
    
    
    func saveProcedure() {
        
        viewModel.addProcedure(
            title: title,
            category: category,
            date: date,
            notes: notes,
            reminderEnabled: false
        )
        
        dismiss()
    }
}

import Foundation

class BeautyTrackerViewModel: ObservableObject {
    
    @Published var procedures: [ProcedureItem] = []
    @Published var cosmetics: [CosmeticItem] = []
    
    
    init() {
        loadDemoData()
    }
    
    
    func loadDemoData() {
        
        procedures = [
            
            ProcedureItem(
                title: "Маска для лица",
                category: "Уход за лицом",
                date: Date(),
                notes: "Увлажняющая маска",
                isCompleted: true,
                reminderEnabled: true
            ),
            
            ProcedureItem(
                title: "Маникюр",
                category: "Ногти",
                date: Calendar.current.date(byAdding: .day, value: 2, to: Date()) ?? Date(),
                notes: "Записаться в салон",
                isCompleted: false,
                reminderEnabled: true
            )
        ]
        
        
        cosmetics = [
            
            CosmeticItem(
                name: "CeraVe Cleanser",
                type: "Очищение",
                expirationDate: Calendar.current.date(byAdding: .month, value: 6, to: Date()) ?? Date(),
                isFavorite: true
            ),
            
            CosmeticItem(
                name: "The Ordinary Niacinamide",
                type: "Сыворотка",
                expirationDate: Calendar.current.date(byAdding: .month, value: 4, to: Date()) ?? Date(),
                isFavorite: false
            )
        ]
    }
    
    
    func addProcedure(title: String, category: String, date: Date, notes: String, reminderEnabled: Bool) {
        
        let newProcedure = ProcedureItem(
            title: title,
            category: category,
            date: date,
            notes: notes,
            isCompleted: false,
            reminderEnabled: reminderEnabled
        )
        
        procedures.append(newProcedure)
    }
    
    
    func toggleProcedureCompletion(for procedure: ProcedureItem) {
        
        if let index = procedures.firstIndex(where: { $0.id == procedure.id }) {
            procedures[index].isCompleted.toggle()
        }
    }
    
    
    func deleteProcedure(at offsets: IndexSet) {
        procedures.remove(atOffsets: offsets)
    }
}

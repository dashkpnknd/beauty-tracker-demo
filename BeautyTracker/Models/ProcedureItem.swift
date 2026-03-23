import Foundation

struct ProcedureItem: Identifiable {
    
    let id = UUID()
    
    var title: String
    var category: String
    var date: Date
    var notes: String
    
    var isCompleted: Bool
    var reminderEnabled: Bool
}

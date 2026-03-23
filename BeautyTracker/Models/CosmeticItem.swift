import Foundation

struct CosmeticItem: Identifiable {
    
    let id = UUID()
    
    var name: String
    var type: String
    var expirationDate: Date
    
    var isFavorite: Bool
}

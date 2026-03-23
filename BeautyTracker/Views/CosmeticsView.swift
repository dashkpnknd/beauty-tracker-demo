import SwiftUI

struct CosmeticsView: View {
    
    @ObservedObject var viewModel: BeautyTrackerViewModel
    
    var body: some View {
        
        NavigationView {
            
            List {
                
                ForEach(viewModel.cosmetics) { cosmetic in
                    
                    HStack {
                        
                        VStack(alignment: .leading, spacing: 4) {
                            
                            Text(cosmetic.name)
                                .font(.headline)
                            
                            Text(cosmetic.type)
                                .font(.subheadline)
                                .foregroundColor(.gray)
                            
                            Text("Годен до: \(cosmetic.expirationDate.formatted(date: .abbreviated, time: .omitted))")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }
                        
                        Spacer()
                        
                        if cosmetic.isFavorite {
                            Image(systemName: "heart.fill")
                                .foregroundColor(.pink)
                        }
                    }
                }
            }
            .navigationTitle("Косметика")
        }
    }
}

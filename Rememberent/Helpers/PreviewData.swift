import Foundation
import SwiftData

@MainActor
class PreviewData {
    
    static let previewContainer: ModelContainer = {
        do {
            let config = ModelConfiguration(isStoredInMemoryOnly: true)
            let container = try ModelContainer(for: Routine.self, Activity.self, configurations: config)
            
            container.mainContext.insert(Routine.stub)
            container.mainContext.insert(Activity.stub)
            
            return container
        } catch {
            fatalError("Failed to Create ModelContainer")
        }
    }()
}

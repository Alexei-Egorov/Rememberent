import Foundation
import SwiftData

final class RememberentAppViewModel {
    
    // MARK: - Properties
    
    private let context: ModelContext
    
    // MARK: - Initialization
    
    init() {
        let modelContainer: ModelContainer
        
        do {
            modelContainer = try ModelContainer(for: Activity.self, Routine.self)
        } catch {
            fatalError("Cannot Initialize ModelContainer")
        }
        
        context = ModelContext(modelContainer)
    }
    
    // MARK: - Public API
    
    var homeViewModel: HomeViewModel {
        let activityRepository = SwiftDataActivityRepository(context: context)
        let routineRepository = SwiftDataRoutineRepository(context: context)
        return HomeViewModel(activityRepository: activityRepository, routineRepository: routineRepository)
    }
}

import Foundation
import SwiftData

class SwiftDataRoutineRepository: RoutineRepository {
    
    // MARK: - Properties
    
    private let context: ModelContext
    
    // MARK: - Initialization
    
    init(context: ModelContext) {
        self.context = context
    }
    
    // MARK: - Public API
    
    func create(_ routine: Routine) {
        context.insert(routine)
    }
    
    func deleteRoutine(for id: UUID) {
        let predicate = #Predicate<Routine> {
            $0.id == id
        }
        do {
            try context.delete(model: Routine.self, where: predicate)
        } catch {
            print("Failed to Delete Routine: \(error)")
        }
    }
    
    func getAllRoutines() -> [Routine] {
        var routines: [Routine] = []
        let descriptor = FetchDescriptor<Routine>()
        do {
            routines = try context.fetch(descriptor)
        } catch {
            print("Failed to Fetch All Routines: \(error)")
        }
        return routines
    }
}

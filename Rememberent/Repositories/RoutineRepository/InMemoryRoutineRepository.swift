import Foundation

class InMemoryRoutineRepository: RoutineRepository {
    
    private var routines: [Routine] = []
    
    func create(_ routine: Routine) {
        routines.append(routine)
    }
    
    func deleteRoutine(for id: UUID) {
        routines.removeAll(where: { $0.id == id })
    }
    
    func getAllRoutines() -> [Routine] {
        routines
    }
}

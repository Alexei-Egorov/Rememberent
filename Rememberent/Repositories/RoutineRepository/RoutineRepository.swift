import Foundation

protocol RoutineRepository {
    
    /// Inserts a new routine in the data store.
    func create(_ routine: Routine)
    
    /// Deletes an existing routine if it exists.
    func deleteRoutine(for id: UUID)
    
    /// Returns all recurring activities stored in memory. If there is no activities, returns empty array.
    func getAllRoutines() -> [Routine]
}

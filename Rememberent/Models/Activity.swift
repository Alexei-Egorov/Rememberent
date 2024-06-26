import Foundation
import SwiftData

@Model
class Activity {
    
    // MARK: - Properties
    
    @Attribute(.unique) var id: UUID = UUID()
    let routine: Routine
    var isFinished: Bool = false
    let creationDate: Date
    
    // MARK: - Initialization
    
    init(routine: Routine, creationDate: Date) {
        self.routine = routine
        self.creationDate = creationDate
    }
}

// MARK: - Hashable

extension Activity: Hashable { }

// MARK: - Stubs

extension Activity {
    
    static let stub = Activity(routine: Routine.stub, creationDate: Date())
    
    static let stubArray = [
        Activity(routine: Routine.stub, creationDate: Date())
    ]
}

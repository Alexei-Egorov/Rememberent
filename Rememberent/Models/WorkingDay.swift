import Foundation

struct WorkingDay: Identifiable {
    
    // MARK: - Properties
    
    var id: UUID = UUID()
    let date: Date
    var activities: [Activity]
    
    // MARK: - Helper Properties
    
    var allActivitiesIDs: [UUID] {
        activities.map(\.id)
    }
}

// MARK: - Stubs

extension WorkingDay {
    
    static let stub = WorkingDay(date: Date(), activities: Activity.stubArray)
}

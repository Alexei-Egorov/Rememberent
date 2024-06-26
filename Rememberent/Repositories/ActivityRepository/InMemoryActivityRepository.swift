import Foundation
import SwiftData

class InMemoryActivityRepository: ActivityRepository {
    
    // MARK: - Properties
    
    private var activities: [Activity] = [Activity.stub]
    
    // MARK: - Public API Methods
    
    func create(_ activity: Activity) {
        activities.append(activity)
    }
    
    func deleteActivity(for id: UUID) {
        activities.removeAll(where: { $0.id == id })
    }
    
    func getAllActivities() -> [Activity] {
        activities
    }
}

import Foundation
import SwiftData

class SwiftDataActivityRepository: ActivityRepository {
    
    // MARK: - Properties
    
    private let context: ModelContext
    
    // MARK: - Initialization
    
    init(context: ModelContext) {
        self.context = context
    }
    
    // MARK: - Public API Methods
    
    func create(_ activity: Activity) {
        context.insert(activity)
    }
    
    func deleteActivity(for id: UUID) {
        let predicate = #Predicate<Activity> {
            $0.id == id
        }
        do {
            try context.delete(model: Activity.self, where: predicate)
        } catch {
            print("Failed to Delete Activity: \(error)")
        }
    }
    
    func getAllActivities() -> [Activity] {
        var activities: [Activity] = []
        let descriptor = FetchDescriptor<Activity>()
        do {
            activities = try context.fetch(descriptor)
        } catch {
            fatalError("Failed to fetch all activities")
        }
        return activities
    }
}

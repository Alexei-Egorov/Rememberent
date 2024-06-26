import Foundation

protocol ActivityRepository {
    
    /// Inserts a new activity in the data store.
    func create(_ activity: Activity)
    
    /// Deletes an existing activity if it exists.
    func deleteActivity(for id: UUID)
    
    /// Returns all activities stored in memory. If there is no activities, returns empty array.
    func getAllActivities() -> [Activity]
    
    // Delete if update will be successed
//    /// Update an activity with given ID if it exsists.
//    func updateActivity(for id: UUID, with newActivity: Activity) async
}

import Foundation

struct ActivityViewModel {
    
    // MARK: - Properties
    
    private let activity: Activity
    
    // MARK: - Initialization
    
    init(activity: Activity) {
        self.activity = activity
    }
    
    // MARK: - Public API Properties
    
    var title: String {
        get {
            activity.routine.title
        }
        set {
            activity.routine.title = newValue
        }
    }
    
    var isFinished: Bool {
        get {
            activity.isFinished
        }
        set {
            activity.isFinished = newValue
        }
    }
}

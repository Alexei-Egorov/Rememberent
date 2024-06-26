import Foundation

@Observable
final class WorkingDayViewModel {
    
    // MARK: - Properties
    
    var workingDay: WorkingDay
    private let calendar = Calendar.current
    
    // MARK: - Initialization
    
    init(workingDay: WorkingDay) {
        print("WorkingDayViewModel initialized")
        self.workingDay = workingDay
    }
    
    // MARK: - Public API Computed Properties
    
    var dayString: String {
        getDayString(from: workingDay.date)
    }
    
    // MARK: - Public API Methods
    
    func toggleActivity(_ activity: Activity) {
        activity.isFinished.toggle()
        
        // If activity's isFinished property became true, move it to bottom.
        workingDay.activities = workingDay.activities.sorted(by: { !$0.isFinished && $1.isFinished })
    }
    
    func getActivityViewModel(for activity: Activity) -> ActivityViewModel {
        ActivityViewModel(activity: activity)
    }
    
    // MARK: - Helper Methods
    
    private func getDayString(from date: Date) -> String {
        let dayString: String
        if calendar.isDateInToday(date) {
            dayString = "Today"
        } else if calendar.isDateInTomorrow(date) {
            dayString = "Tomorrow"
        } else if calendar.isDateInYesterday(date) {
            dayString = "Yesterday"
        } else {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "dd.MM"
            dayString = dateFormatter.string(from: date)
        }
        return dayString
    }
}

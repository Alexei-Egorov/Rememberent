import Foundation

@Observable
final class HomeViewModel {
    
    // MARK: - Properties
    
    private let activityRepository: ActivityRepository
    private let routineRepository: RoutineRepository
    var sortedActivities: [[Activity]] = []
    
    private let calendar = Calendar.current
    
    // MARK: - Public API Properties
    
    var workingDays: [WorkingDay] = []
    
    init(activityRepository: ActivityRepository, routineRepository: RoutineRepository) {
        self.activityRepository = activityRepository
        self.routineRepository = routineRepository
    }
    
    // MARK: - Public API Methods
    
    /// Central method of application. Shuld be executed every time user gets back to the application.
    func start() {
        // Get all activities
        var allActivities: [Activity] = activityRepository.getAllActivities()
        let allRoutines: [Routine] = routineRepository.getAllRoutines()
        
        let oldWorkingDays = groupActivitiesByWorkingDay(allActivities)
        
        // Delete old completed Working Days
        let now = Date()
        oldWorkingDays.forEach { workingDay in
            if workingDay.date < calendar.startOfDay(for: now) && workingDay.activities.allSatisfy({ $0.isFinished == true }) {
                workingDay.allActivitiesIDs.forEach(activityRepository.deleteActivity(for:))
            }
        }
        
        // For every day during next week check, if Activity is already created. If not, create and add to allActivities.
        allRoutines.forEach({ addActivitiesForRoutine($0, allActivities: &allActivities) })
        
        workingDays = groupActivitiesByWorkingDay(allActivities).sorted(by: { $0.date < $1.date })
    }
    
    func workingDayViewModel(for workingDay: WorkingDay) -> WorkingDayViewModel {
        WorkingDayViewModel(workingDay: workingDay)
    }
    
    // MARK: - Support Methods
    
    /// Transforms given `[Activity]` array into `[WorkingDay]` array.
    private func groupActivitiesByWorkingDay(_ activities: [Activity]) -> [WorkingDay] {
        var workingDays: [WorkingDay] = []
        let groupedActivities = Dictionary(grouping: activities, by: { $0.creationDate })
        
        groupedActivities.forEach { (date, activities) in
            let sortedActivities = activities.sorted(by: { !$0.isFinished && $1.isFinished })
            workingDays.append(WorkingDay(date: date, activities: sortedActivities))
        }
        
        return workingDays
    }
    
    /// For given routine check, if activity already already persists in given `allActivities` array. If not, create and add to given array with all activities.
    private func addActivitiesForRoutine(_ routine: Routine, allActivities: inout [Activity]) {
        for i in 0...6 {
            if let date941 = calendar.setDateTo941AMUTC(for: Date()),
               let newDate = calendar.addDays(i, to: date941),
               routine.isDateMatching(newDate) ?? false,
               !allActivities.contains(where: { $0.creationDate == newDate && $0.routine == routine })
            {
                let newActivity = Activity(routine: routine, creationDate: newDate)
                activityRepository.create(newActivity)
                allActivities.append(newActivity)
            }
        }
    }
}

// MARK: - Debug Methods

extension HomeViewModel {
    
    func addExampleRoutines() {
        let date1 = calendar.createDate(year: 2024, month: 6, day: 20)!
        let routine1 = Routine(title: "Make new WD", startDate: date1, repeatDaysCount: 3)
        routineRepository.create(routine1)
        
        let date2 = calendar.createDate(year: 2024, month: 6, day: 22)!
        let routine2 = Routine(title: "Adept new newbie", startDate: date2, repeatDaysCount: 2)
        routineRepository.create(routine2)
        
        let date3 = calendar.createDate(year: 2024, month: 6, day: 26)!
        let routine3 = Routine(title: "Create new routine", startDate: date3, repeatDaysCount: 2)
        routineRepository.create(routine3)
    }
    
    func printAllDatabase() {
        let allActivities: [Activity] = activityRepository.getAllActivities()
        let allRoutines: [Routine] = routineRepository.getAllRoutines()
        
        print("All activities: \(allActivities)")
        print("All routines: \(allRoutines)")
    }
    
    func eraseDatabase() {
        let allActivities: [Activity] = activityRepository.getAllActivities()
        let allRoutines: [Routine] = routineRepository.getAllRoutines()
        
        allActivities.forEach { activityRepository.deleteActivity(for: $0.id) }
        allRoutines.forEach { routineRepository.deleteRoutine(for: $0.id) }
    }
    
    func printActivity(_ activity: Activity) {
        print("Activity with routine title \(activity.routine.title)")
        print("creationDate: \(activity.creationDate)")
        print("isFinished: \(activity.isFinished)")
    }
}

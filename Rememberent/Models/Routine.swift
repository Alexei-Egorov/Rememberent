import Foundation
import SwiftData

@Model
class Routine {
    
    // MARK: - Properties
    
    @Attribute(.unique) var id: UUID = UUID()
    var title: String
    var startDate: Date
    var repeatDaysCount: Int
    
    // MARK: - Initialization
    
    init(title: String, startDate: Date, repeatDaysCount: Int) {
        self.title = title
        self.startDate = startDate
        self.repeatDaysCount = repeatDaysCount
    }
    
    // MARK: - Support Methods
    
    /// Check if activity can be created for given date.
    func isDateMatching(_ date: Date) -> Bool? {
        let calendar = Calendar.current
        guard let date941 = calendar.setDateTo941AMUTC(for: date),
              let startDate941 = calendar.setDateTo941AMUTC(for: startDate) else {
            return nil
        }
        
        guard let daysBetween = calendar.daysBetween(start: startDate941, end: date941) else {
            return nil
        }
        return daysBetween % repeatDaysCount == 0
    }
    
}

// MARK: - Stubs

extension Routine {
    
    static let stub = Routine(title: "Change the bed line 100 times", startDate: Date(), repeatDaysCount: 3)
    
    static let stubArray = [
        Routine(title: "Append new prefix", startDate: Date(), repeatDaysCount: 4),
        Routine(title: "Update privacy politics", startDate: Date(), repeatDaysCount: 2)
    ]
}

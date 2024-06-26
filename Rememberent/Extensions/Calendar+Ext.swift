import Foundation

extension Calendar {
    
    /// Returns given date incremented by one day.
    func addDayToDate(_ date: Date) -> Date? {
        Calendar.current.date(byAdding: .day, value: 1, to: date)
    }
    
    /// Add certain number of days to given date.
    func addDays(_ numberOfDays: Int, to date: Date) -> Date? {
        Calendar.current.date(byAdding: .day, value: numberOfDays, to: date)
    }
    
    /// Create date with specified date components.
    func createDate(year: Int, month: Int, day: Int, hour: Int = 9, minute: Int = 41, second: Int = 0) -> Date? {
        guard let utcTimeZone = TimeZone(abbreviation: "UTC") else {
            return nil
        }
        var calendar = Self.current
        calendar.timeZone = utcTimeZone
        
        var dateComponents = DateComponents()
        dateComponents.year = year
        dateComponents.month = month
        dateComponents.day = day
        dateComponents.hour = hour
        dateComponents.minute = minute
        dateComponents.second = second
        
        return calendar.date(from: dateComponents)
    }
    
    /// Returns number of whole days between `start` and `and` dates.
    func daysBetween(start: Date, end: Date) -> Int? {
        let components = Calendar.current.dateComponents([.day], from: start, to: end)
        return components.day
    }
    
    /// Sets given date to 9:41 AM.
    func setDateTo941AMUTC(for date: Date) -> Date? {
        guard let utcTimeZone = TimeZone(abbreviation: "UTC") else {
            return nil
        }
        var calendar = Self.current
        calendar.timeZone = utcTimeZone
        
        var dateComponents = calendar.dateComponents([.year, .month, .day], from: date)
        dateComponents.hour = 9
        dateComponents.minute = 41
        dateComponents.second = 0
        
        return calendar.date(from: dateComponents)
    }
}

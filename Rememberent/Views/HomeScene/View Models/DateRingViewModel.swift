import Foundation

struct DateRingViewModel {
    
    // MARK: - Properties
    
    private let date: Date = Date()
    
    // MARK: - PublicAPI
    
    var day: Int {
        Calendar.current.component(.day, from: date)
    }
    
    var month: String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "LLLL"
        return dateFormatter.string(from: date)
    }
}

import Foundation

extension Date {
    func toIso8601() -> String {
        return DateFormatter.iso8601.string(from: self)
    }
    
    func minutes(from date: Date) -> Int {
        return Calendar.current.dateComponents([.minute], from: date, to: self).minute ?? 0
    }
    
    func minutesFromNow() -> Int {
        return minutes(from: Date())
    }
}

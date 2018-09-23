import Foundation

extension String {
    func fromIso8601() -> Date? {
        return DateFormatter.iso8601.date(from: self)
    }
}

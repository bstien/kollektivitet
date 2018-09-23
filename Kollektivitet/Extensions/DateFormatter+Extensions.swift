import Foundation

extension DateFormatter {
    static var iso8601: DateFormatter {
        let df = DateFormatter()
        df.dateFormat = "YYYY-MM-dd'T'HH:mm:ssZZZZZ"
        return df
    }
}

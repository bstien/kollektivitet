import WatchKit

class DepartureRow: NSObject {
    @IBOutlet weak var lineNameLabel: WKInterfaceLabel!
    @IBOutlet weak var lineNumberLabel: WKInterfaceLabel!
    @IBOutlet weak var transportTypeImage: WKInterfaceImage!
    @IBOutlet weak var departuresAtLabel: WKInterfaceLabel!
    
    var departure: Departure! {
        didSet {
            configure()
        }
    }
    
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter
    }
    
    func getDepartureText(for date: Date) -> String {
        let minutesToDepartment = date.minutesFromNow()
        if (minutesToDepartment == 0) {
            return "nå"
        } else
            if (0..<45).contains(minutesToDepartment) {
                return "\(minutesToDepartment) min"
            } else {
                return dateFormatter.string(from: date)
        }
    }
    
    func getDepartureColor(for date: Date) -> UIColor {
        let minutesToDepartment = date.minutesFromNow()
        
        if (minutesToDepartment == 0) {
            return Style.alarmingRed
        } else
            if (0..<45).contains(minutesToDepartment) {
                if (0..<10).contains(minutesToDepartment) {
                    let colorFraction = 1.0 - (Double(minutesToDepartment) / 10.0)
                    return Style.calmGreen.interpolateRGBColorTo(Style.alarmingRed, fraction: CGFloat(colorFraction))!
                } else {
                    return Style.calmGreen
                }
            } else {
                return Style.coolWhite
        }
    }
    
    private func configure() {
        lineNameLabel.setText(departure.destinationDisplay?.frontText)
        lineNumberLabel.setText(departure.serviceJourney?.line.publicCode)
        
        if let departmentsAt = departure.expectedArrivalTime!.fromIso8601() {
            departuresAtLabel.setText(getDepartureText(for: departmentsAt))
            departuresAtLabel.setTextColor(getDepartureColor(for: departmentsAt))
        } else {
            departuresAtLabel.setText("? min")
            departuresAtLabel.setTextColor(Style.ignorantGray)
        }
        
        if let transportMode = departure.serviceJourney?.line.transportMode {
            switch transportMode {
            case .metro:
                transportTypeImage.setImage(UIImage(named: "metro"))
            case .bus:
                transportTypeImage.setImage(UIImage(named: "bus"))
            case .tram:
                transportTypeImage.setImage(UIImage(named: "tram"))
            default:
                return
            }
        }
    }
}

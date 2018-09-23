import Foundation
import WatchKit

class DepartureLocationRow: NSObject {
    @IBOutlet weak var titleLabel: WKInterfaceLabel!
    
    var departureLocation: DepartureLocation! {
        didSet {
            configure()
        }
    }
    
    private func configure() {
        titleLabel.setText(departureLocation.name)
    }
}

import Foundation
import WatchKit

struct DepartureLocation {
    var name: String
    var quayId: String
}

class DepartureLocationChooserInterfaceController: WKInterfaceController {
    @IBOutlet weak var table: WKInterfaceTable!
    
    var departureLocations: [DepartureLocation] = [
        DepartureLocation(name: "Stortinget", quayId: "NSR:Quay:7256"),
        DepartureLocation(name: "Manglerud", quayId: "NSR:Quay:10851")
    ]
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        populateTable()
    }
    
    private func populateTable() {
        table.setNumberOfRows(departureLocations.count, withRowType: "DepartureLocationRow")
        for (index, departureLocation) in departureLocations.enumerated() {
            set(row: index, to: departureLocation)
        }
    }
    
    func set(row: Int, to departureLocation: DepartureLocation) {
        guard let row = table.rowController(at: row) as? DepartureLocationRow else { return }
        row.departureLocation = departureLocation
    }
    
    override func table(_ table: WKInterfaceTable, didSelectRowAt rowIndex: Int) {
        let row = table.rowController(at: rowIndex) as! DepartureLocationRow
        pushController(withName: "DeparturesListInterfaceController", context: row.departureLocation)
    }
}

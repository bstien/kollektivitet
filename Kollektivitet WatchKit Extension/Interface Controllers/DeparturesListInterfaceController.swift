import WatchKit
import Foundation
import Apollo

class DeparturesListInterfaceController: WKInterfaceController {
    @IBOutlet weak var table: WKInterfaceTable!
    @IBOutlet weak var statusLabel: WKInterfaceLabel!
    private let departureService = DepartureService()
    private var departures = [Departure]() {
        didSet {
            self.reloadTable()
        }
    }
    private var departureLocation: DepartureLocation!
    private var queryTimer: Timer?
    private var currentRequest: Cancellable?
    
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        guard let departureLocation = context as? DepartureLocation else { return }
        self.departureLocation = departureLocation
        setTitle(departureLocation.name)
    }
    
    @objc
    private func refreshData() {
        print("Refetching data")
        currentRequest?.cancel()
        currentRequest = departureService.getDepartures(fromQuay: departureLocation.quayId) { [weak self] result in
            switch (result) {
            case .fetchError(let error):
                print("Error occured...!")
                print(error)
                self?.statusLabel.setHidden(false)
                self?.statusLabel.setText("Klarte ikke hente data")
                self?.statusLabel.setTextColor(Style.alarmingRed)
                return
            case .success(let departures):
                print("Success!")
                self?.departures = departures
                self?.statusLabel.setHidden(true)
                self?.statusLabel.setText("Laster ...")
                self?.statusLabel.setTextColor(Style.coolWhite)
            }
        }
    }
    
    private func reloadTable() {
        table.setNumberOfRows(departures.count, withRowType: "DepartureRow")
        for rowIndex in 0..<departures.count {
            set(row: rowIndex, to: departures[rowIndex])
        }
    }
    
    private func set(row: Int, to departure: Departure) {
        guard let row = table.rowController(at: row) as? DepartureRow else { return }
        row.departure = departure
    }

    override func willActivate() {
        super.willActivate()
        queryTimer = Timer.scheduledTimer(timeInterval: 30.0, target: self, selector: #selector(refreshData), userInfo: nil, repeats: true)
        queryTimer?.fire()
    }

    override func didDeactivate() {
        super.didDeactivate()
        queryTimer?.invalidate()
        currentRequest?.cancel()
    }
}

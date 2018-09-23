import Foundation
import Apollo

enum TripResult {
    case success(departures: [Departure])
    case fetchError(Error)
}

class DepartureService {
    private let graphUrl = URL(string: "https://api.entur.org/journeyplanner/2.0/index/graphql")!
    private(set) var client: ApolloClient!
    
    init() {
        client = ApolloClient(url: graphUrl)
    }
    
    func getDepartures(fromQuay: String, when: Date = Date(), completion: @escaping (TripResult) -> Void) -> Cancellable {
        let request = client.fetch(query: DeparturesQuery(from: fromQuay, when: when.toIso8601())) { (result, error) in
            guard let data = result?.data else {
                completion(.fetchError(error!))
                return
            }
            
            let departures = data.quay?.estimatedCalls?.compactMap {
                $0?.fragments.departure
                } ?? []
            completion(.success(departures: departures))
        }
        
        return request
    }
}

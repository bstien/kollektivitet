//  This file was automatically generated and should not be edited.

import Apollo

public enum TransportMode: RawRepresentable, Equatable, Apollo.JSONDecodable, Apollo.JSONEncodable {
  public typealias RawValue = String
  case air
  case bus
  case cableway
  case water
  case funicular
  case lift
  case rail
  case metro
  case tram
  case coach
  case unknown
  /// Auto generated constant for unknown enum values
  case __unknown(RawValue)

  public init?(rawValue: RawValue) {
    switch rawValue {
      case "air": self = .air
      case "bus": self = .bus
      case "cableway": self = .cableway
      case "water": self = .water
      case "funicular": self = .funicular
      case "lift": self = .lift
      case "rail": self = .rail
      case "metro": self = .metro
      case "tram": self = .tram
      case "coach": self = .coach
      case "unknown": self = .unknown
      default: self = .__unknown(rawValue)
    }
  }

  public var rawValue: RawValue {
    switch self {
      case .air: return "air"
      case .bus: return "bus"
      case .cableway: return "cableway"
      case .water: return "water"
      case .funicular: return "funicular"
      case .lift: return "lift"
      case .rail: return "rail"
      case .metro: return "metro"
      case .tram: return "tram"
      case .coach: return "coach"
      case .unknown: return "unknown"
      case .__unknown(let value): return value
    }
  }

  public static func == (lhs: TransportMode, rhs: TransportMode) -> Bool {
    switch (lhs, rhs) {
      case (.air, .air): return true
      case (.bus, .bus): return true
      case (.cableway, .cableway): return true
      case (.water, .water): return true
      case (.funicular, .funicular): return true
      case (.lift, .lift): return true
      case (.rail, .rail): return true
      case (.metro, .metro): return true
      case (.tram, .tram): return true
      case (.coach, .coach): return true
      case (.unknown, .unknown): return true
      case (.__unknown(let lhsValue), .__unknown(let rhsValue)): return lhsValue == rhsValue
      default: return false
    }
  }
}

public final class DeparturesQuery: GraphQLQuery {
  public let operationDefinition =
    "query Departures($from: String!, $when: DateTime!) {\n  quay(id: $from) {\n    __typename\n    id\n    description\n    name\n    stopPlace {\n      __typename\n      id\n      name\n    }\n    estimatedCalls(startTime: $when, numberOfDepartures: 30) {\n      __typename\n      ...Departure\n    }\n  }\n}"

  public var queryDocument: String { return operationDefinition.appending(Departure.fragmentDefinition) }

  public var from: String
  public var when: String

  public init(from: String, when: String) {
    self.from = from
    self.when = when
  }

  public var variables: GraphQLMap? {
    return ["from": from, "when": when]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["QueryType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("quay", arguments: ["id": GraphQLVariable("from")], type: .object(Quay.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(quay: Quay? = nil) {
      self.init(unsafeResultMap: ["__typename": "QueryType", "quay": quay.flatMap { (value: Quay) -> ResultMap in value.resultMap }])
    }

    /// Get a single quay based on its id)
    public var quay: Quay? {
      get {
        return (resultMap["quay"] as? ResultMap).flatMap { Quay(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "quay")
      }
    }

    public struct Quay: GraphQLSelectionSet {
      public static let possibleTypes = ["Quay"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("description", type: .scalar(String.self)),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("stopPlace", type: .object(StopPlace.selections)),
        GraphQLField("estimatedCalls", arguments: ["startTime": GraphQLVariable("when"), "numberOfDepartures": 30], type: .list(.object(EstimatedCall.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID, description: String? = nil, name: String, stopPlace: StopPlace? = nil, estimatedCalls: [EstimatedCall?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Quay", "id": id, "description": description, "name": name, "stopPlace": stopPlace.flatMap { (value: StopPlace) -> ResultMap in value.resultMap }, "estimatedCalls": estimatedCalls.flatMap { (value: [EstimatedCall?]) -> [ResultMap?] in value.map { (value: EstimatedCall?) -> ResultMap? in value.flatMap { (value: EstimatedCall) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var description: String? {
        get {
          return resultMap["description"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "description")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// The stop place to which this quay belongs to.
      public var stopPlace: StopPlace? {
        get {
          return (resultMap["stopPlace"] as? ResultMap).flatMap { StopPlace(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "stopPlace")
        }
      }

      /// List of visits to this quay as part of vehicle journeys.
      public var estimatedCalls: [EstimatedCall?]? {
        get {
          return (resultMap["estimatedCalls"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [EstimatedCall?] in value.map { (value: ResultMap?) -> EstimatedCall? in value.flatMap { (value: ResultMap) -> EstimatedCall in EstimatedCall(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [EstimatedCall?]) -> [ResultMap?] in value.map { (value: EstimatedCall?) -> ResultMap? in value.flatMap { (value: EstimatedCall) -> ResultMap in value.resultMap } } }, forKey: "estimatedCalls")
        }
      }

      public struct StopPlace: GraphQLSelectionSet {
        public static let possibleTypes = ["StopPlace"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("name", type: .nonNull(.scalar(String.self))),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, name: String) {
          self.init(unsafeResultMap: ["__typename": "StopPlace", "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var name: String {
          get {
            return resultMap["name"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }

      public struct EstimatedCall: GraphQLSelectionSet {
        public static let possibleTypes = ["EstimatedCall"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("expectedArrivalTime", type: .scalar(String.self)),
          GraphQLField("aimedArrivalTime", type: .scalar(String.self)),
          GraphQLField("destinationDisplay", type: .object(DestinationDisplay.selections)),
          GraphQLField("serviceJourney", type: .object(ServiceJourney.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(expectedArrivalTime: String? = nil, aimedArrivalTime: String? = nil, destinationDisplay: DestinationDisplay? = nil, serviceJourney: ServiceJourney? = nil) {
          self.init(unsafeResultMap: ["__typename": "EstimatedCall", "expectedArrivalTime": expectedArrivalTime, "aimedArrivalTime": aimedArrivalTime, "destinationDisplay": destinationDisplay.flatMap { (value: DestinationDisplay) -> ResultMap in value.resultMap }, "serviceJourney": serviceJourney.flatMap { (value: ServiceJourney) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// Expected time of arrival at quay. Updated with real time information if available. Will be null if an actualArrivalTime exists
        public var expectedArrivalTime: String? {
          get {
            return resultMap["expectedArrivalTime"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "expectedArrivalTime")
          }
        }

        /// Scheduled time of arrival at quay. Not affected by read time updated
        public var aimedArrivalTime: String? {
          get {
            return resultMap["aimedArrivalTime"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "aimedArrivalTime")
          }
        }

        public var destinationDisplay: DestinationDisplay? {
          get {
            return (resultMap["destinationDisplay"] as? ResultMap).flatMap { DestinationDisplay(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "destinationDisplay")
          }
        }

        public var serviceJourney: ServiceJourney? {
          get {
            return (resultMap["serviceJourney"] as? ResultMap).flatMap { ServiceJourney(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "serviceJourney")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var departure: Departure {
            get {
              return Departure(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }

        public struct DestinationDisplay: GraphQLSelectionSet {
          public static let possibleTypes = ["DestinationDisplay"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("frontText", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(frontText: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "DestinationDisplay", "frontText": frontText])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Name of destination to show on front of vehicle.
          public var frontText: String? {
            get {
              return resultMap["frontText"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "frontText")
            }
          }
        }

        public struct ServiceJourney: GraphQLSelectionSet {
          public static let possibleTypes = ["ServiceJourney"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("line", type: .nonNull(.object(Line.selections))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(line: Line) {
            self.init(unsafeResultMap: ["__typename": "ServiceJourney", "line": line.resultMap])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var line: Line {
            get {
              return Line(unsafeResultMap: resultMap["line"]! as! ResultMap)
            }
            set {
              resultMap.updateValue(newValue.resultMap, forKey: "line")
            }
          }

          public struct Line: GraphQLSelectionSet {
            public static let possibleTypes = ["Line"]

            public static let selections: [GraphQLSelection] = [
              GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
              GraphQLField("transportMode", type: .scalar(TransportMode.self)),
              GraphQLField("publicCode", type: .scalar(String.self)),
            ]

            public private(set) var resultMap: ResultMap

            public init(unsafeResultMap: ResultMap) {
              self.resultMap = unsafeResultMap
            }

            public init(transportMode: TransportMode? = nil, publicCode: String? = nil) {
              self.init(unsafeResultMap: ["__typename": "Line", "transportMode": transportMode, "publicCode": publicCode])
            }

            public var __typename: String {
              get {
                return resultMap["__typename"]! as! String
              }
              set {
                resultMap.updateValue(newValue, forKey: "__typename")
              }
            }

            public var transportMode: TransportMode? {
              get {
                return resultMap["transportMode"] as? TransportMode
              }
              set {
                resultMap.updateValue(newValue, forKey: "transportMode")
              }
            }

            /// Publicly announced code for line, differentiating it from other lines for the same operator.
            public var publicCode: String? {
              get {
                return resultMap["publicCode"] as? String
              }
              set {
                resultMap.updateValue(newValue, forKey: "publicCode")
              }
            }
          }
        }
      }
    }
  }
}

public final class StopInformationQuery: GraphQLQuery {
  public let operationDefinition =
    "query StopInformation($stopId: String!) {\n  stopPlace(id: $stopId) {\n    __typename\n    name\n    id\n    quays {\n      __typename\n      ...QuayInfo\n    }\n  }\n}"

  public var queryDocument: String { return operationDefinition.appending(QuayInfo.fragmentDefinition) }

  public var stopId: String

  public init(stopId: String) {
    self.stopId = stopId
  }

  public var variables: GraphQLMap? {
    return ["stopId": stopId]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["QueryType"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("stopPlace", arguments: ["id": GraphQLVariable("stopId")], type: .object(StopPlace.selections)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(stopPlace: StopPlace? = nil) {
      self.init(unsafeResultMap: ["__typename": "QueryType", "stopPlace": stopPlace.flatMap { (value: StopPlace) -> ResultMap in value.resultMap }])
    }

    /// Get a single stopPlace based on its id)
    public var stopPlace: StopPlace? {
      get {
        return (resultMap["stopPlace"] as? ResultMap).flatMap { StopPlace(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "stopPlace")
      }
    }

    public struct StopPlace: GraphQLSelectionSet {
      public static let possibleTypes = ["StopPlace"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("name", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
        GraphQLField("quays", type: .list(.object(Quay.selections))),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(name: String, id: GraphQLID, quays: [Quay?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "StopPlace", "name": name, "id": id, "quays": quays.flatMap { (value: [Quay?]) -> [ResultMap?] in value.map { (value: Quay?) -> ResultMap? in value.flatMap { (value: Quay) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var name: String {
        get {
          return resultMap["name"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      public var id: GraphQLID {
        get {
          return resultMap["id"]! as! GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// Returns all quays that are children of this stop place
      public var quays: [Quay?]? {
        get {
          return (resultMap["quays"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Quay?] in value.map { (value: ResultMap?) -> Quay? in value.flatMap { (value: ResultMap) -> Quay in Quay(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Quay?]) -> [ResultMap?] in value.map { (value: Quay?) -> ResultMap? in value.flatMap { (value: Quay) -> ResultMap in value.resultMap } } }, forKey: "quays")
        }
      }

      public struct Quay: GraphQLSelectionSet {
        public static let possibleTypes = ["Quay"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
          GraphQLField("description", type: .scalar(String.self)),
          GraphQLField("publicCode", type: .scalar(String.self)),
          GraphQLField("lines", type: .list(.nonNull(.object(Line.selections)))),
          GraphQLField("stopPlace", type: .object(StopPlace.selections)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID, description: String? = nil, publicCode: String? = nil, lines: [Line]? = nil, stopPlace: StopPlace? = nil) {
          self.init(unsafeResultMap: ["__typename": "Quay", "id": id, "description": description, "publicCode": publicCode, "lines": lines.flatMap { (value: [Line]) -> [ResultMap] in value.map { (value: Line) -> ResultMap in value.resultMap } }, "stopPlace": stopPlace.flatMap { (value: StopPlace) -> ResultMap in value.resultMap }])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var id: GraphQLID {
          get {
            return resultMap["id"]! as! GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        public var description: String? {
          get {
            return resultMap["description"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "description")
          }
        }

        /// Public code used to identify this quay within the stop place. For instance a platform code.
        public var publicCode: String? {
          get {
            return resultMap["publicCode"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "publicCode")
          }
        }

        /// List of lines servicing this quay
        public var lines: [Line]? {
          get {
            return (resultMap["lines"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Line] in value.map { (value: ResultMap) -> Line in Line(unsafeResultMap: value) } }
          }
          set {
            resultMap.updateValue(newValue.flatMap { (value: [Line]) -> [ResultMap] in value.map { (value: Line) -> ResultMap in value.resultMap } }, forKey: "lines")
          }
        }

        /// The stop place to which this quay belongs to.
        public var stopPlace: StopPlace? {
          get {
            return (resultMap["stopPlace"] as? ResultMap).flatMap { StopPlace(unsafeResultMap: $0) }
          }
          set {
            resultMap.updateValue(newValue?.resultMap, forKey: "stopPlace")
          }
        }

        public var fragments: Fragments {
          get {
            return Fragments(unsafeResultMap: resultMap)
          }
          set {
            resultMap += newValue.resultMap
          }
        }

        public struct Fragments {
          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public var quayInfo: QuayInfo {
            get {
              return QuayInfo(unsafeResultMap: resultMap)
            }
            set {
              resultMap += newValue.resultMap
            }
          }
        }

        public struct Line: GraphQLSelectionSet {
          public static let possibleTypes = ["Line"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("publicCode", type: .scalar(String.self)),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(publicCode: String? = nil) {
            self.init(unsafeResultMap: ["__typename": "Line", "publicCode": publicCode])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          /// Publicly announced code for line, differentiating it from other lines for the same operator.
          public var publicCode: String? {
            get {
              return resultMap["publicCode"] as? String
            }
            set {
              resultMap.updateValue(newValue, forKey: "publicCode")
            }
          }
        }

        public struct StopPlace: GraphQLSelectionSet {
          public static let possibleTypes = ["StopPlace"]

          public static let selections: [GraphQLSelection] = [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
            GraphQLField("transportMode", type: .scalar(TransportMode.self)),
            GraphQLField("name", type: .nonNull(.scalar(String.self))),
          ]

          public private(set) var resultMap: ResultMap

          public init(unsafeResultMap: ResultMap) {
            self.resultMap = unsafeResultMap
          }

          public init(id: GraphQLID, transportMode: TransportMode? = nil, name: String) {
            self.init(unsafeResultMap: ["__typename": "StopPlace", "id": id, "transportMode": transportMode, "name": name])
          }

          public var __typename: String {
            get {
              return resultMap["__typename"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "__typename")
            }
          }

          public var id: GraphQLID {
            get {
              return resultMap["id"]! as! GraphQLID
            }
            set {
              resultMap.updateValue(newValue, forKey: "id")
            }
          }

          /// The transport mode serviced by this stop place.
          public var transportMode: TransportMode? {
            get {
              return resultMap["transportMode"] as? TransportMode
            }
            set {
              resultMap.updateValue(newValue, forKey: "transportMode")
            }
          }

          public var name: String {
            get {
              return resultMap["name"]! as! String
            }
            set {
              resultMap.updateValue(newValue, forKey: "name")
            }
          }
        }
      }
    }
  }
}

public struct Departure: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment Departure on EstimatedCall {\n  __typename\n  expectedArrivalTime\n  aimedArrivalTime\n  destinationDisplay {\n    __typename\n    frontText\n  }\n  serviceJourney {\n    __typename\n    line {\n      __typename\n      transportMode\n      publicCode\n    }\n  }\n}"

  public static let possibleTypes = ["EstimatedCall"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("expectedArrivalTime", type: .scalar(String.self)),
    GraphQLField("aimedArrivalTime", type: .scalar(String.self)),
    GraphQLField("destinationDisplay", type: .object(DestinationDisplay.selections)),
    GraphQLField("serviceJourney", type: .object(ServiceJourney.selections)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(expectedArrivalTime: String? = nil, aimedArrivalTime: String? = nil, destinationDisplay: DestinationDisplay? = nil, serviceJourney: ServiceJourney? = nil) {
    self.init(unsafeResultMap: ["__typename": "EstimatedCall", "expectedArrivalTime": expectedArrivalTime, "aimedArrivalTime": aimedArrivalTime, "destinationDisplay": destinationDisplay.flatMap { (value: DestinationDisplay) -> ResultMap in value.resultMap }, "serviceJourney": serviceJourney.flatMap { (value: ServiceJourney) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  /// Expected time of arrival at quay. Updated with real time information if available. Will be null if an actualArrivalTime exists
  public var expectedArrivalTime: String? {
    get {
      return resultMap["expectedArrivalTime"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "expectedArrivalTime")
    }
  }

  /// Scheduled time of arrival at quay. Not affected by read time updated
  public var aimedArrivalTime: String? {
    get {
      return resultMap["aimedArrivalTime"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "aimedArrivalTime")
    }
  }

  public var destinationDisplay: DestinationDisplay? {
    get {
      return (resultMap["destinationDisplay"] as? ResultMap).flatMap { DestinationDisplay(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "destinationDisplay")
    }
  }

  public var serviceJourney: ServiceJourney? {
    get {
      return (resultMap["serviceJourney"] as? ResultMap).flatMap { ServiceJourney(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "serviceJourney")
    }
  }

  public struct DestinationDisplay: GraphQLSelectionSet {
    public static let possibleTypes = ["DestinationDisplay"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("frontText", type: .scalar(String.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(frontText: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "DestinationDisplay", "frontText": frontText])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Name of destination to show on front of vehicle.
    public var frontText: String? {
      get {
        return resultMap["frontText"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "frontText")
      }
    }
  }

  public struct ServiceJourney: GraphQLSelectionSet {
    public static let possibleTypes = ["ServiceJourney"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("line", type: .nonNull(.object(Line.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(line: Line) {
      self.init(unsafeResultMap: ["__typename": "ServiceJourney", "line": line.resultMap])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var line: Line {
      get {
        return Line(unsafeResultMap: resultMap["line"]! as! ResultMap)
      }
      set {
        resultMap.updateValue(newValue.resultMap, forKey: "line")
      }
    }

    public struct Line: GraphQLSelectionSet {
      public static let possibleTypes = ["Line"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("transportMode", type: .scalar(TransportMode.self)),
        GraphQLField("publicCode", type: .scalar(String.self)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(transportMode: TransportMode? = nil, publicCode: String? = nil) {
        self.init(unsafeResultMap: ["__typename": "Line", "transportMode": transportMode, "publicCode": publicCode])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var transportMode: TransportMode? {
        get {
          return resultMap["transportMode"] as? TransportMode
        }
        set {
          resultMap.updateValue(newValue, forKey: "transportMode")
        }
      }

      /// Publicly announced code for line, differentiating it from other lines for the same operator.
      public var publicCode: String? {
        get {
          return resultMap["publicCode"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "publicCode")
        }
      }
    }
  }
}

public struct QuayInfo: GraphQLFragment {
  public static let fragmentDefinition =
    "fragment QuayInfo on Quay {\n  __typename\n  id\n  description\n  publicCode\n  lines {\n    __typename\n    publicCode\n  }\n  stopPlace {\n    __typename\n    id\n    transportMode\n    name\n  }\n}"

  public static let possibleTypes = ["Quay"]

  public static let selections: [GraphQLSelection] = [
    GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
    GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
    GraphQLField("description", type: .scalar(String.self)),
    GraphQLField("publicCode", type: .scalar(String.self)),
    GraphQLField("lines", type: .list(.nonNull(.object(Line.selections)))),
    GraphQLField("stopPlace", type: .object(StopPlace.selections)),
  ]

  public private(set) var resultMap: ResultMap

  public init(unsafeResultMap: ResultMap) {
    self.resultMap = unsafeResultMap
  }

  public init(id: GraphQLID, description: String? = nil, publicCode: String? = nil, lines: [Line]? = nil, stopPlace: StopPlace? = nil) {
    self.init(unsafeResultMap: ["__typename": "Quay", "id": id, "description": description, "publicCode": publicCode, "lines": lines.flatMap { (value: [Line]) -> [ResultMap] in value.map { (value: Line) -> ResultMap in value.resultMap } }, "stopPlace": stopPlace.flatMap { (value: StopPlace) -> ResultMap in value.resultMap }])
  }

  public var __typename: String {
    get {
      return resultMap["__typename"]! as! String
    }
    set {
      resultMap.updateValue(newValue, forKey: "__typename")
    }
  }

  public var id: GraphQLID {
    get {
      return resultMap["id"]! as! GraphQLID
    }
    set {
      resultMap.updateValue(newValue, forKey: "id")
    }
  }

  public var description: String? {
    get {
      return resultMap["description"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "description")
    }
  }

  /// Public code used to identify this quay within the stop place. For instance a platform code.
  public var publicCode: String? {
    get {
      return resultMap["publicCode"] as? String
    }
    set {
      resultMap.updateValue(newValue, forKey: "publicCode")
    }
  }

  /// List of lines servicing this quay
  public var lines: [Line]? {
    get {
      return (resultMap["lines"] as? [ResultMap]).flatMap { (value: [ResultMap]) -> [Line] in value.map { (value: ResultMap) -> Line in Line(unsafeResultMap: value) } }
    }
    set {
      resultMap.updateValue(newValue.flatMap { (value: [Line]) -> [ResultMap] in value.map { (value: Line) -> ResultMap in value.resultMap } }, forKey: "lines")
    }
  }

  /// The stop place to which this quay belongs to.
  public var stopPlace: StopPlace? {
    get {
      return (resultMap["stopPlace"] as? ResultMap).flatMap { StopPlace(unsafeResultMap: $0) }
    }
    set {
      resultMap.updateValue(newValue?.resultMap, forKey: "stopPlace")
    }
  }

  public struct Line: GraphQLSelectionSet {
    public static let possibleTypes = ["Line"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("publicCode", type: .scalar(String.self)),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(publicCode: String? = nil) {
      self.init(unsafeResultMap: ["__typename": "Line", "publicCode": publicCode])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    /// Publicly announced code for line, differentiating it from other lines for the same operator.
    public var publicCode: String? {
      get {
        return resultMap["publicCode"] as? String
      }
      set {
        resultMap.updateValue(newValue, forKey: "publicCode")
      }
    }
  }

  public struct StopPlace: GraphQLSelectionSet {
    public static let possibleTypes = ["StopPlace"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
      GraphQLField("id", type: .nonNull(.scalar(GraphQLID.self))),
      GraphQLField("transportMode", type: .scalar(TransportMode.self)),
      GraphQLField("name", type: .nonNull(.scalar(String.self))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(id: GraphQLID, transportMode: TransportMode? = nil, name: String) {
      self.init(unsafeResultMap: ["__typename": "StopPlace", "id": id, "transportMode": transportMode, "name": name])
    }

    public var __typename: String {
      get {
        return resultMap["__typename"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "__typename")
      }
    }

    public var id: GraphQLID {
      get {
        return resultMap["id"]! as! GraphQLID
      }
      set {
        resultMap.updateValue(newValue, forKey: "id")
      }
    }

    /// The transport mode serviced by this stop place.
    public var transportMode: TransportMode? {
      get {
        return resultMap["transportMode"] as? TransportMode
      }
      set {
        resultMap.updateValue(newValue, forKey: "transportMode")
      }
    }

    public var name: String {
      get {
        return resultMap["name"]! as! String
      }
      set {
        resultMap.updateValue(newValue, forKey: "name")
      }
    }
  }
}
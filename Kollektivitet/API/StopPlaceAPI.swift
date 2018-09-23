//  This file was automatically generated and should not be edited.

import Apollo

public final class StopQuery: GraphQLQuery {
  public let operationDefinition =
    "query Stop($query: String!) {\n  stopPlace(query: $query, municipalityReference: [\"KVE:TopographicPlace:0301\"]) {\n    __typename\n    id\n    name {\n      __typename\n      value\n    }\n  }\n}"

  public var query: String

  public init(query: String) {
    self.query = query
  }

  public var variables: GraphQLMap? {
    return ["query": query]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes = ["StopPlaceRegister"]

    public static let selections: [GraphQLSelection] = [
      GraphQLField("stopPlace", arguments: ["query": GraphQLVariable("query"), "municipalityReference": ["KVE:TopographicPlace:0301"]], type: .list(.object(StopPlace.selections))),
    ]

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(stopPlace: [StopPlace?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "StopPlaceRegister", "stopPlace": stopPlace.flatMap { (value: [StopPlace?]) -> [ResultMap?] in value.map { (value: StopPlace?) -> ResultMap? in value.flatMap { (value: StopPlace) -> ResultMap in value.resultMap } } }])
    }

    /// Search for StopPlaces
    public var stopPlace: [StopPlace?]? {
      get {
        return (resultMap["stopPlace"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [StopPlace?] in value.map { (value: ResultMap?) -> StopPlace? in value.flatMap { (value: ResultMap) -> StopPlace in StopPlace(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [StopPlace?]) -> [ResultMap?] in value.map { (value: StopPlace?) -> ResultMap? in value.flatMap { (value: StopPlace) -> ResultMap in value.resultMap } } }, forKey: "stopPlace")
      }
    }

    public struct StopPlace: GraphQLSelectionSet {
      public static let possibleTypes = ["StopPlace", "ParentStopPlace"]

      public static let selections: [GraphQLSelection] = [
        GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
        GraphQLField("id", type: .scalar(String.self)),
        GraphQLField("name", type: .object(Name.selections)),
      ]

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public static func makeStopPlace(id: String? = nil, name: Name? = nil) -> StopPlace {
        return StopPlace(unsafeResultMap: ["__typename": "StopPlace", "id": id, "name": name.flatMap { (value: Name) -> ResultMap in value.resultMap }])
      }

      public static func makeParentStopPlace(id: String? = nil, name: Name? = nil) -> StopPlace {
        return StopPlace(unsafeResultMap: ["__typename": "ParentStopPlace", "id": id, "name": name.flatMap { (value: Name) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var id: String? {
        get {
          return resultMap["id"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      public var name: Name? {
        get {
          return (resultMap["name"] as? ResultMap).flatMap { Name(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "name")
        }
      }

      public struct Name: GraphQLSelectionSet {
        public static let possibleTypes = ["EmbeddableMultilingualString"]

        public static let selections: [GraphQLSelection] = [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("value", type: .scalar(String.self)),
        ]

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(value: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "EmbeddableMultilingualString", "value": value])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        public var value: String? {
          get {
            return resultMap["value"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "value")
          }
        }
      }
    }
  }
}
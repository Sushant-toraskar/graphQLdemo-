// @generated
//  This file was automatically generated and should not be edited.

import Apollo
import Foundation

public final class GetAllEpisodesWithPageQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getAllEpisodesWithPage($page: Int) {
      episodes(page: $page) {
        __typename
        info {
          __typename
          count
          pages
          next
        }
        results {
          __typename
          id
          name
        }
      }
    }
    """

  public let operationName: String = "getAllEpisodesWithPage"

  public var page: Int?

  public init(page: Int? = nil) {
    self.page = page
  }

  public var variables: GraphQLMap? {
    return ["page": page]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("episodes", arguments: ["page": GraphQLVariable("page")], type: .object(Episode.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(episodes: Episode? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "episodes": episodes.flatMap { (value: Episode) -> ResultMap in value.resultMap }])
    }

    /// Get the list of all episodes
    public var episodes: Episode? {
      get {
        return (resultMap["episodes"] as? ResultMap).flatMap { Episode(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "episodes")
      }
    }

    public struct Episode: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Episodes"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("info", type: .object(Info.selections)),
          GraphQLField("results", type: .list(.object(Result.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(info: Info? = nil, results: [Result?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Episodes", "info": info.flatMap { (value: Info) -> ResultMap in value.resultMap }, "results": results.flatMap { (value: [Result?]) -> [ResultMap?] in value.map { (value: Result?) -> ResultMap? in value.flatMap { (value: Result) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var info: Info? {
        get {
          return (resultMap["info"] as? ResultMap).flatMap { Info(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "info")
        }
      }

      public var results: [Result?]? {
        get {
          return (resultMap["results"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Result?] in value.map { (value: ResultMap?) -> Result? in value.flatMap { (value: ResultMap) -> Result in Result(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Result?]) -> [ResultMap?] in value.map { (value: Result?) -> ResultMap? in value.flatMap { (value: Result) -> ResultMap in value.resultMap } } }, forKey: "results")
        }
      }

      public struct Info: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Info"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("count", type: .scalar(Int.self)),
            GraphQLField("pages", type: .scalar(Int.self)),
            GraphQLField("next", type: .scalar(Int.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(count: Int? = nil, pages: Int? = nil, next: Int? = nil) {
          self.init(unsafeResultMap: ["__typename": "Info", "count": count, "pages": pages, "next": next])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The length of the response.
        public var count: Int? {
          get {
            return resultMap["count"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "count")
          }
        }

        /// The amount of pages.
        public var pages: Int? {
          get {
            return resultMap["pages"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "pages")
          }
        }

        /// Number of the next page (if it exists)
        public var next: Int? {
          get {
            return resultMap["next"] as? Int
          }
          set {
            resultMap.updateValue(newValue, forKey: "next")
          }
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Episode"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("name", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, name: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Episode", "id": id, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the episode.
        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The name of the episode.
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class GetAllEpisodesQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getAllEpisodes {
      characters {
        __typename
        results {
          __typename
          id
          name
          status
          species
          type
          gender
          image
        }
      }
    }
    """

  public let operationName: String = "getAllEpisodes"

  public init() {
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("characters", type: .object(Character.selections)),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(characters: Character? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "characters": characters.flatMap { (value: Character) -> ResultMap in value.resultMap }])
    }

    /// Get the list of all characters
    public var characters: Character? {
      get {
        return (resultMap["characters"] as? ResultMap).flatMap { Character(unsafeResultMap: $0) }
      }
      set {
        resultMap.updateValue(newValue?.resultMap, forKey: "characters")
      }
    }

    public struct Character: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Characters"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("results", type: .list(.object(Result.selections))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(results: [Result?]? = nil) {
        self.init(unsafeResultMap: ["__typename": "Characters", "results": results.flatMap { (value: [Result?]) -> [ResultMap?] in value.map { (value: Result?) -> ResultMap? in value.flatMap { (value: Result) -> ResultMap in value.resultMap } } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      public var results: [Result?]? {
        get {
          return (resultMap["results"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [Result?] in value.map { (value: ResultMap?) -> Result? in value.flatMap { (value: ResultMap) -> Result in Result(unsafeResultMap: value) } } }
        }
        set {
          resultMap.updateValue(newValue.flatMap { (value: [Result?]) -> [ResultMap?] in value.map { (value: Result?) -> ResultMap? in value.flatMap { (value: Result) -> ResultMap in value.resultMap } } }, forKey: "results")
        }
      }

      public struct Result: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Character"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("status", type: .scalar(String.self)),
            GraphQLField("species", type: .scalar(String.self)),
            GraphQLField("type", type: .scalar(String.self)),
            GraphQLField("gender", type: .scalar(String.self)),
            GraphQLField("image", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, name: String? = nil, status: String? = nil, species: String? = nil, type: String? = nil, gender: String? = nil, image: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Character", "id": id, "name": name, "status": status, "species": species, "type": type, "gender": gender, "image": image])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the character.
        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// The name of the character.
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// The status of the character ('Alive', 'Dead' or 'unknown').
        public var status: String? {
          get {
            return resultMap["status"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "status")
          }
        }

        /// The species of the character.
        public var species: String? {
          get {
            return resultMap["species"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "species")
          }
        }

        /// The type or subspecies of the character.
        public var type: String? {
          get {
            return resultMap["type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
        public var gender: String? {
          get {
            return resultMap["gender"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "gender")
          }
        }

        /// Link to the character's image.
        /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }
      }
    }
  }
}

public final class GetEpisodeByIdQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getEpisodeByID($id: [ID!]!) {
      episodesByIds(ids: $id) {
        __typename
        id
        name
        air_date
        episode
        characters {
          __typename
          id
          image
          name
        }
      }
    }
    """

  public let operationName: String = "getEpisodeByID"

  public var id: [GraphQLID]

  public init(id: [GraphQLID]) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("episodesByIds", arguments: ["ids": GraphQLVariable("id")], type: .list(.object(EpisodesById.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(episodesByIds: [EpisodesById?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "episodesByIds": episodesByIds.flatMap { (value: [EpisodesById?]) -> [ResultMap?] in value.map { (value: EpisodesById?) -> ResultMap? in value.flatMap { (value: EpisodesById) -> ResultMap in value.resultMap } } }])
    }

    /// Get a list of episodes selected by ids
    public var episodesByIds: [EpisodesById?]? {
      get {
        return (resultMap["episodesByIds"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [EpisodesById?] in value.map { (value: ResultMap?) -> EpisodesById? in value.flatMap { (value: ResultMap) -> EpisodesById in EpisodesById(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [EpisodesById?]) -> [ResultMap?] in value.map { (value: EpisodesById?) -> ResultMap? in value.flatMap { (value: EpisodesById) -> ResultMap in value.resultMap } } }, forKey: "episodesByIds")
      }
    }

    public struct EpisodesById: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Episode"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("air_date", type: .scalar(String.self)),
          GraphQLField("episode", type: .scalar(String.self)),
          GraphQLField("characters", type: .nonNull(.list(.object(Character.selections)))),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, name: String? = nil, airDate: String? = nil, episode: String? = nil, characters: [Character?]) {
        self.init(unsafeResultMap: ["__typename": "Episode", "id": id, "name": name, "air_date": airDate, "episode": episode, "characters": characters.map { (value: Character?) -> ResultMap? in value.flatMap { (value: Character) -> ResultMap in value.resultMap } }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The id of the episode.
      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The name of the episode.
      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// The air date of the episode.
      public var airDate: String? {
        get {
          return resultMap["air_date"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "air_date")
        }
      }

      /// The code of the episode.
      public var episode: String? {
        get {
          return resultMap["episode"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "episode")
        }
      }

      /// List of characters who have been seen in the episode.
      public var characters: [Character?] {
        get {
          return (resultMap["characters"] as! [ResultMap?]).map { (value: ResultMap?) -> Character? in value.flatMap { (value: ResultMap) -> Character in Character(unsafeResultMap: value) } }
        }
        set {
          resultMap.updateValue(newValue.map { (value: Character?) -> ResultMap? in value.flatMap { (value: Character) -> ResultMap in value.resultMap } }, forKey: "characters")
        }
      }

      public struct Character: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Character"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("id", type: .scalar(GraphQLID.self)),
            GraphQLField("image", type: .scalar(String.self)),
            GraphQLField("name", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(id: GraphQLID? = nil, image: String? = nil, name: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Character", "id": id, "image": image, "name": name])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The id of the character.
        public var id: GraphQLID? {
          get {
            return resultMap["id"] as? GraphQLID
          }
          set {
            resultMap.updateValue(newValue, forKey: "id")
          }
        }

        /// Link to the character's image.
        /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
        public var image: String? {
          get {
            return resultMap["image"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "image")
          }
        }

        /// The name of the character.
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }
      }
    }
  }
}

public final class GetCharacterByIdQuery: GraphQLQuery {
  /// The raw GraphQL definition of this operation.
  public let operationDefinition: String =
    """
    query getCharacterByID($id: [ID!]!) {
      charactersByIds(ids: $id) {
        __typename
        id
        name
        status
        species
        type
        gender
        image
        location {
          __typename
          name
          type
          dimension
          created
        }
      }
    }
    """

  public let operationName: String = "getCharacterByID"

  public var id: [GraphQLID]

  public init(id: [GraphQLID]) {
    self.id = id
  }

  public var variables: GraphQLMap? {
    return ["id": id]
  }

  public struct Data: GraphQLSelectionSet {
    public static let possibleTypes: [String] = ["Query"]

    public static var selections: [GraphQLSelection] {
      return [
        GraphQLField("charactersByIds", arguments: ["ids": GraphQLVariable("id")], type: .list(.object(CharactersById.selections))),
      ]
    }

    public private(set) var resultMap: ResultMap

    public init(unsafeResultMap: ResultMap) {
      self.resultMap = unsafeResultMap
    }

    public init(charactersByIds: [CharactersById?]? = nil) {
      self.init(unsafeResultMap: ["__typename": "Query", "charactersByIds": charactersByIds.flatMap { (value: [CharactersById?]) -> [ResultMap?] in value.map { (value: CharactersById?) -> ResultMap? in value.flatMap { (value: CharactersById) -> ResultMap in value.resultMap } } }])
    }

    /// Get a list of characters selected by ids
    public var charactersByIds: [CharactersById?]? {
      get {
        return (resultMap["charactersByIds"] as? [ResultMap?]).flatMap { (value: [ResultMap?]) -> [CharactersById?] in value.map { (value: ResultMap?) -> CharactersById? in value.flatMap { (value: ResultMap) -> CharactersById in CharactersById(unsafeResultMap: value) } } }
      }
      set {
        resultMap.updateValue(newValue.flatMap { (value: [CharactersById?]) -> [ResultMap?] in value.map { (value: CharactersById?) -> ResultMap? in value.flatMap { (value: CharactersById) -> ResultMap in value.resultMap } } }, forKey: "charactersByIds")
      }
    }

    public struct CharactersById: GraphQLSelectionSet {
      public static let possibleTypes: [String] = ["Character"]

      public static var selections: [GraphQLSelection] {
        return [
          GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
          GraphQLField("id", type: .scalar(GraphQLID.self)),
          GraphQLField("name", type: .scalar(String.self)),
          GraphQLField("status", type: .scalar(String.self)),
          GraphQLField("species", type: .scalar(String.self)),
          GraphQLField("type", type: .scalar(String.self)),
          GraphQLField("gender", type: .scalar(String.self)),
          GraphQLField("image", type: .scalar(String.self)),
          GraphQLField("location", type: .object(Location.selections)),
        ]
      }

      public private(set) var resultMap: ResultMap

      public init(unsafeResultMap: ResultMap) {
        self.resultMap = unsafeResultMap
      }

      public init(id: GraphQLID? = nil, name: String? = nil, status: String? = nil, species: String? = nil, type: String? = nil, gender: String? = nil, image: String? = nil, location: Location? = nil) {
        self.init(unsafeResultMap: ["__typename": "Character", "id": id, "name": name, "status": status, "species": species, "type": type, "gender": gender, "image": image, "location": location.flatMap { (value: Location) -> ResultMap in value.resultMap }])
      }

      public var __typename: String {
        get {
          return resultMap["__typename"]! as! String
        }
        set {
          resultMap.updateValue(newValue, forKey: "__typename")
        }
      }

      /// The id of the character.
      public var id: GraphQLID? {
        get {
          return resultMap["id"] as? GraphQLID
        }
        set {
          resultMap.updateValue(newValue, forKey: "id")
        }
      }

      /// The name of the character.
      public var name: String? {
        get {
          return resultMap["name"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "name")
        }
      }

      /// The status of the character ('Alive', 'Dead' or 'unknown').
      public var status: String? {
        get {
          return resultMap["status"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "status")
        }
      }

      /// The species of the character.
      public var species: String? {
        get {
          return resultMap["species"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "species")
        }
      }

      /// The type or subspecies of the character.
      public var type: String? {
        get {
          return resultMap["type"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "type")
        }
      }

      /// The gender of the character ('Female', 'Male', 'Genderless' or 'unknown').
      public var gender: String? {
        get {
          return resultMap["gender"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "gender")
        }
      }

      /// Link to the character's image.
      /// All images are 300x300px and most are medium shots or portraits since they are intended to be used as avatars.
      public var image: String? {
        get {
          return resultMap["image"] as? String
        }
        set {
          resultMap.updateValue(newValue, forKey: "image")
        }
      }

      /// The character's last known location
      public var location: Location? {
        get {
          return (resultMap["location"] as? ResultMap).flatMap { Location(unsafeResultMap: $0) }
        }
        set {
          resultMap.updateValue(newValue?.resultMap, forKey: "location")
        }
      }

      public struct Location: GraphQLSelectionSet {
        public static let possibleTypes: [String] = ["Location"]

        public static var selections: [GraphQLSelection] {
          return [
            GraphQLField("__typename", type: .nonNull(.scalar(String.self))),
            GraphQLField("name", type: .scalar(String.self)),
            GraphQLField("type", type: .scalar(String.self)),
            GraphQLField("dimension", type: .scalar(String.self)),
            GraphQLField("created", type: .scalar(String.self)),
          ]
        }

        public private(set) var resultMap: ResultMap

        public init(unsafeResultMap: ResultMap) {
          self.resultMap = unsafeResultMap
        }

        public init(name: String? = nil, type: String? = nil, dimension: String? = nil, created: String? = nil) {
          self.init(unsafeResultMap: ["__typename": "Location", "name": name, "type": type, "dimension": dimension, "created": created])
        }

        public var __typename: String {
          get {
            return resultMap["__typename"]! as! String
          }
          set {
            resultMap.updateValue(newValue, forKey: "__typename")
          }
        }

        /// The name of the location.
        public var name: String? {
          get {
            return resultMap["name"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "name")
          }
        }

        /// The type of the location.
        public var type: String? {
          get {
            return resultMap["type"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "type")
          }
        }

        /// The dimension in which the location is located.
        public var dimension: String? {
          get {
            return resultMap["dimension"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "dimension")
          }
        }

        /// Time at which the location was created in the database.
        public var created: String? {
          get {
            return resultMap["created"] as? String
          }
          set {
            resultMap.updateValue(newValue, forKey: "created")
          }
        }
      }
    }
  }
}

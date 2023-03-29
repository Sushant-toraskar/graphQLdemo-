//
//  Network.swift
//  LegacyGraphql
//
//  Created by Neosoft on 23/03/23.
//

import Foundation
import Apollo

class Network {
    static let shared = Network()
    
    private (set) lazy var apollo = ApolloClient(url: URL(string: "https://rickandmortyapi.com/graphql")!)
}

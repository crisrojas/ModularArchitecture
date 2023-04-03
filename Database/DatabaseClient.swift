//
//  DatabaseClient.swift
//  Database
//
//  Created by Cristian Felipe Patiño Rojas on 03/04/2023.
//

import Foundation

public struct Feed: Identifiable { public let id: UUID }

private var store = Array(0...20).map { _ in Feed(id: .init())}

public final class DatabaseClient {
    public init() {}
    public func readFeed() async -> [Feed] {store}
}

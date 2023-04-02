//
//  DatabaseClient.swift
//  Database
//
//  Created by Cristian Felipe Patiño Rojas on 03/04/2023.
//

import Foundation

public struct FeedPO: Identifiable { public let id: UUID }
public typealias FeedPOs = [FeedPO]

private var store = Array(0...20).map { _ in FeedPO(id: .init())}

public final class DatabaseClient {
    public init() {}
    public func readFeed() async -> FeedPOs {store}
}

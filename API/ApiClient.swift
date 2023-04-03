//
//  ApiClient.swift
//  API
//
//  Created by Cristian Felipe Patiño Rojas on 03/04/2023.
//

import Foundation

public struct Feed: Identifiable { public let id: UUID }

private var store = Array(0...10).map { _ in Feed(id: .init())}

public final class APIClient {
    public init() {}
    public func fetchFeed() async -> [Feed] {store}
}

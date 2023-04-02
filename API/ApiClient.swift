//
//  ApiClient.swift
//  API
//
//  Created by Cristian Felipe Patiño Rojas on 03/04/2023.
//

import Foundation

public struct FeedSO: Identifiable { public let id: UUID }
public typealias FeedSOs = [FeedSO]

private var store = Array(0...10).map { _ in FeedSO(id: .init())}

public final class APIClient {
    public init() {}
    public func fetchFeed() async -> FeedSOs {store}
}

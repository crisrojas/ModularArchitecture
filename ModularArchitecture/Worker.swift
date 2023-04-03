//
//  Worker.swift
//  ModularArchitecture
//
//  Created by Cristian Felipe Patiño Rojas on 03/04/2023.
//

import API
import Database
import UI
import Reachability

func makeFeedLoader() -> FeedView.Loader {
    #if DEBUG
    makeDebugFeed
    #else
    Reachability.isReachable
    ? fetchRemoteFeed
    : readLocalFeed
    #endif
}

func readLocalFeed() async -> [UI.Feed] {
    let localFeed = await DatabaseClient().readFeed()
    return localFeed.map { UI.Feed(id: $0.id) }
}

func fetchRemoteFeed() async -> [UI.Feed] {
    let remoteFeed = await APIClient().fetchFeed()
    return remoteFeed.map { UI.Feed(id: $0.id) }
}

#if DEBUG
func makeDebugFeed() async -> [UI.Feed] {
    Array(0...3).map { _ in UI.Feed(id: .init()) }
}
#endif

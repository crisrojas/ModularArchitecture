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
    Reachability.isReachable
    ? fetchRemoteFeed
    : readLocalFeed
}

func readLocalFeed() async -> FeedVOs {
    let localFeed = await DatabaseClient().readFeed()
    return localFeed.map { FeedVO(id: $0.id) }
}

func fetchRemoteFeed() async -> FeedVOs {
    let remoteFeed = await APIClient().fetchFeed()
    return remoteFeed.map { FeedVO(id: $0.id) }
}

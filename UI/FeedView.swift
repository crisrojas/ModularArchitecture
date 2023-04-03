//
//  FeedView.swift
//  UI
//
//  Created by Cristian Felipe Patiño Rojas on 03/04/2023.
//

import SwiftUI

public struct Feed: Identifiable {
    public let id: UUID
    public init(id: UUID) { self.id = id }
}

public struct FeedView: View {
    
    @State private var state = ViewState.idle
    enum ViewState {
        case idle
        case loading
        case success([Feed])
        case error(String)
    }
    
    public typealias Loader = () async -> [Feed]
    public let load: Loader
    public init(loader l: @escaping Loader) {load = l}
    
    public var body: some View {
        switch state {
        case .idle, .loading: loadView
        case .success(let vos): feedList(vos)
        case .error(let error): Text(error)
        }
    }
    
    var loadView: some View {
        ProgressView().task {
            let vos = await load()
            state = .success(vos)
        }
    }
    
    func feedList(_ vos: [Feed]) -> some View {
        List(vos) { item in
            Text(item.id.description)
        }
    }
}

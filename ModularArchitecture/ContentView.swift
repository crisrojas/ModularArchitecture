//
//  ContentView.swift
//  ModularArchitecture
//
//  Created by Cristian Felipe Patiño Rojas on 02/04/2023.
//

import SwiftUI
import UI

struct ContentView: View {
    var body: some View {
        FeedView(loader: makeFeedLoader())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

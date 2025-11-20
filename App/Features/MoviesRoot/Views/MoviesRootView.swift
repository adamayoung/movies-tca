//
//  MoviesRootView.swift
//  MoviesTCA
//
//  Created by Adam Young on 18/11/2025.
//

import ComposableArchitecture
import MovieDetailsFeature
import SwiftUI
import TrendingMoviesFeature

struct MoviesRootView: View {

    @Bindable var store: StoreOf<MoviesRootFeature>

    var body: some View {
        NavigationStack(path: $store.scope(state: \.path, action: \.path)) {
            TrendingMoviesView(
                store: store.scope(
                    state: \.trending,
                    action: \.trending
                )
            )
        } destination: { store in
            switch store.case {
            case .details(let store):
                MovieDetailsView(store: store)
            }
        }
    }
}

#Preview {
    MoviesRootView(
        store: Store(
            initialState: MoviesRootFeature.State(),
            reducer: {
                MoviesRootFeature()
            }
        )
    )
}

//
//  TrendingMoviesView.swift
//  TrendingMoviesFeature
//
//  Created by Adam Young on 17/11/2025.
//

import ComposableArchitecture
import DesignSystem
import SwiftUI

public struct TrendingMoviesView: View {

    @Bindable var store: StoreOf<TrendingMoviesFeature>

    public init(store: StoreOf<TrendingMoviesFeature>) {
        self._store = .init(store)
    }

    public var body: some View {
        List(store.movies) { movie in
            NavigationRow {
                store.send(.navigate(.movieDetails(id: movie.id)))
            } content: {
                MovieRow(
                    id: movie.id,
                    title: movie.title,
                    posterURL: movie.posterURL
                )
            }
        }
        .navigationTitle("Trending")
        .task {
            store.send(.loadTrendingMovies)
        }
    }

}

#Preview {
    TrendingMoviesView(
        store: Store(
            initialState: TrendingMoviesFeature.State(),
            reducer: {
                TrendingMoviesFeature()
            }
        )
    )
}

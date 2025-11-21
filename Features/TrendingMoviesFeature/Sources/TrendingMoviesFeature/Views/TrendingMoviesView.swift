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

    private var movies: [MoviePreview] {
        store.movies
    }

    private var isLoading: Bool {
        store.isInitiallyLoading
    }

    public init(store: StoreOf<TrendingMoviesFeature>) {
        self._store = .init(store)
    }

    public var body: some View {
        List(movies) { movie in
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
        .overlay {
            if isLoading {
                ProgressView()
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

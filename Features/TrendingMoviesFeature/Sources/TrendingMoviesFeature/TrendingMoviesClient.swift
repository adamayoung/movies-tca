//
//  TrendingMoviesClient.swift
//  TrendingMoviesFeature
//
//  Created by Adam Young on 17/11/2025.
//

import ComposableArchitecture
import Foundation
import TrendingAdapters

struct TrendingMoviesClient: Sendable {

    var fetch: @Sendable () async throws -> [MoviePreview]

}

extension TrendingMoviesClient: DependencyKey {

    static var liveValue: TrendingMoviesClient {
        TrendingMoviesClient(
            fetch: {
                let fetchTrendingMoviesUseCase = DependencyValues._current.fetchTrendingMovies
                let movieItems = try await fetchTrendingMoviesUseCase.execute()

                let moviePreviews = movieItems.map {
                    MoviePreview(
                        id: $0.id,
                        title: $0.title,
                        posterURL: $0.posterURLSet?.thumbnail
                    )
                }

                return moviePreviews
            }
        )
    }

    static var previewValue: TrendingMoviesClient {
        TrendingMoviesClient(
            fetch: {
                [
                    MoviePreview(
                        id: 1,
                        title: "The Running Man",
                        posterURL: URL(
                            string:
                                "https://image.tmdb.org/t/p/w780/dKL78O9zxczVgjtNcQ9UkbYLzqX.jpg")
                    ),
                    MoviePreview(
                        id: 2,
                        title: "Black Phone 2",
                        posterURL: URL(
                            string:
                                "https://image.tmdb.org/t/p/w780/xUWUODKPIilQoFUzjHM6wKJkP3Y.jpg")
                    )
                ]
            }
        )
    }

}

extension DependencyValues {

    var trendingMovies: TrendingMoviesClient {
        get {
            self[TrendingMoviesClient.self]
        }
        set {
            self[TrendingMoviesClient.self] = newValue
        }
    }

}

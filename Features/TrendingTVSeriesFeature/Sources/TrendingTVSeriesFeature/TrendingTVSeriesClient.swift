//
//  TrendingTVSeriesClient.swift
//  MoviesTCA
//
//  Created by Adam Young on 18/11/2025.
//

import ComposableArchitecture
import Foundation
import TrendingAdapters

struct TrendingTVSeriesClient: Sendable {

    var fetch: @Sendable () async throws -> [TVSeriesPreview]

}

extension TrendingTVSeriesClient: DependencyKey {

    static var liveValue: TrendingTVSeriesClient {
        TrendingTVSeriesClient(
            fetch: {
                let fetchTrendingTVSeriesUseCase = DependencyValues._current.fetchTrendingTVSeries
                let tvSeriesItems = try await fetchTrendingTVSeriesUseCase.execute()

                let tvSeriesPreviews = tvSeriesItems.map {
                    TVSeriesPreview(
                        id: $0.id,
                        name: $0.name,
                        posterURL: $0.posterURLSet?.thumbnail
                    )
                }

                return tvSeriesPreviews
            }
        )
    }

    static var previewValue: TrendingTVSeriesClient {
        TrendingTVSeriesClient(
            fetch: {
                [
                    TVSeriesPreview(
                        id: 225171,
                        name: "Pluribus",
                        posterURL: URL(
                            string:
                                "https://image.tmdb.org/t/p/w780/nrM2xFUfKJJEmZzd5d7kohT2G0C.jpg")
                    ),
                    TVSeriesPreview(
                        id: 66732,
                        name: "Stranger Things",
                        posterURL: URL(
                            string:
                                "https://image.tmdb.org/t/p/w780/cVxVGwHce6xnW8UaVUggaPXbmoE.jpg")
                    )
                ]
            }
        )
    }

}

extension DependencyValues {

    var trendingTVSeries: TrendingTVSeriesClient {
        get {
            self[TrendingTVSeriesClient.self]
        }
        set {
            self[TrendingTVSeriesClient.self] = newValue
        }
    }

}

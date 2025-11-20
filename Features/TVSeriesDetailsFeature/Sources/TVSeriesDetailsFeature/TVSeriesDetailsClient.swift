//
//  TVSeriesDetailsClient.swift
//  TVSeriesDetailsFeature
//
//  Created by Adam Young on 18/11/2025.
//

import ComposableArchitecture
import Foundation
import TVAdapters
import TVApplication

struct TVSeriesDetailsClient: Sendable {

    var fetch: @Sendable (Int) async throws -> TVSeries

}

extension TVSeriesDetailsClient: DependencyKey {

    static var liveValue: TVSeriesDetailsClient {
        TVSeriesDetailsClient(
            fetch: { id in
                let fetchTVSeriesUseCase = DependencyValues._current.fetchTVSeries
                let tvSeries = try await fetchTVSeriesUseCase.execute(id: id)

                return TVSeries(
                    id: tvSeries.id,
                    name: tvSeries.name,
                    posterURL: tvSeries.posterURLSet?.detail
                )
            }
        )
    }

    static var previewValue: TVSeriesDetailsClient {
        TVSeriesDetailsClient(
            fetch: { _ in
                TVSeries(
                    id: 66732,
                    name: "Stranger Things",
                    posterURL: URL(
                        string: "https://image.tmdb.org/t/p/w780/cVxVGwHce6xnW8UaVUggaPXbmoE.jpg")
                )
            }
        )
    }

}

extension DependencyValues {

    var tvSeriesDetails: TVSeriesDetailsClient {
        get {
            self[TVSeriesDetailsClient.self]
        }
        set {
            self[TVSeriesDetailsClient.self] = newValue
        }
    }

}

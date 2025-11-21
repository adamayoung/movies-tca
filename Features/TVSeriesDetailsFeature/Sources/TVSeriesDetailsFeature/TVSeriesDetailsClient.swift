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
                let useCase = DependencyValues._current.fetchTVSeriesDetails
                let tvSeries = try await useCase.execute(id: id)
                let mapper = TVSeriesMapper()
                return mapper.map(tvSeries)
            }
        )
    }

    static var previewValue: TVSeriesDetailsClient {
        TVSeriesDetailsClient(
            fetch: { _ in
                TVSeries(
                    id: 66732,
                    name: "Stranger Things",
                    overview: "When a young boy vanishes, a small town uncovers a mystery involving secret experiments, terrifying supernatural forces, and one strange little girl.",
                    posterURL: URL(string: "https://image.tmdb.org/t/p/w780/cVxVGwHce6xnW8UaVUggaPXbmoE.jpg")
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

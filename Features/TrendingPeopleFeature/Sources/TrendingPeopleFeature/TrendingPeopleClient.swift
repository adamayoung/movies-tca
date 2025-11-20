//
//  TrendingPeopleClient.swift
//  TrendingPeopleFeature
//
//  Created by Adam Young on 19/11/2025.
//

import ComposableArchitecture
import Foundation
import TrendingAdapters

struct TrendingPeopleClient: Sendable {

    var fetch: @Sendable () async throws -> [PersonPreview]

}

extension TrendingPeopleClient: DependencyKey {

    static var liveValue: TrendingPeopleClient {
        TrendingPeopleClient(
            fetch: {
                let fetchTrendingPeopleUseCase = DependencyValues._current.fetchTrendingPeople
                let personItems = try await fetchTrendingPeopleUseCase.execute()

                let personPreviews = personItems.map {
                    PersonPreview(
                        id: $0.id,
                        name: $0.name,
                        profileURL: $0.profileURLSet?.thumbnail
                    )
                }

                return personPreviews
            }
        )
    }

    static var previewValue: TrendingPeopleClient {
        TrendingPeopleClient(
            fetch: {
                [
                    PersonPreview(
                        id: 234352,
                        name: "Margot Robbie",
                        profileURL: URL(
                            string:
                                "https://image.tmdb.org/t/p/h632/euDPyqLnuwaWMHajcU3oZ9uZezR.jpg")
                    ),
                    PersonPreview(
                        id: 2283,
                        name: "Stanley Tucci",
                        profileURL: URL(
                            string:
                                "https://image.tmdb.org/t/p/h632/q4TanMDI5Rgsvw4SfyNbPBh4URr.jpg")
                    )
                ]
            }
        )
    }

}

extension DependencyValues {

    var trendingPeople: TrendingPeopleClient {
        get {
            self[TrendingPeopleClient.self]
        }
        set {
            self[TrendingPeopleClient.self] = newValue
        }
    }

}

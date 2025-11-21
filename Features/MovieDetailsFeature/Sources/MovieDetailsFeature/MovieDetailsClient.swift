//
//  MovieDetailsClient.swift
//  MovieDetailsFeature
//
//  Created by Adam Young on 17/11/2025.
//

import ComposableArchitecture
import Foundation
import MoviesAdapters
import MoviesApplication

struct MovieDetailsClient: Sendable {

    var fetch: @Sendable (Int) async throws -> Movie

}

extension MovieDetailsClient: DependencyKey {

    static var liveValue: MovieDetailsClient {
        MovieDetailsClient(
            fetch: { id in
                let useCase = DependencyValues._current.fetchMovieDetails
                let movie = try await useCase.execute(id: id)
                let mapper = MovieMapper()
                return mapper.map(movie)
            }
        )
    }

    static var previewValue: MovieDetailsClient {
        MovieDetailsClient(
            fetch: { _ in
                try await Task.sleep(for: .seconds(2))

                return Movie(
                    id: 1,
                    title: "The Running Man",
                    overview:
                        "Desperate to save his sick daughter, working-class Ben Richards is convinced by The Running Man's charming but ruthless producer to enter the deadly competition game as a last resort. But Ben's defiance, instincts, and grit turn him into an unexpected fan favorite - and a threat to the entire system. As ratings skyrocket, so does the danger, and Ben must outwit not just the Hunters, but a nation addicted to watching him fall.",
                    posterURL: URL(
                        string: "https://image.tmdb.org/t/p/w780/dKL78O9zxczVgjtNcQ9UkbYLzqX.jpg"),
                    backdropURL: URL(string: "https://image.tmdb.org/t/p/w1280/docDyCJrhPoFXAckB1aOiIv9Mz0.jpg")
                )
            }
        )
    }

}

extension DependencyValues {

    var movieDetails: MovieDetailsClient {
        get {
            self[MovieDetailsClient.self]
        }
        set {
            self[MovieDetailsClient.self] = newValue
        }
    }

}

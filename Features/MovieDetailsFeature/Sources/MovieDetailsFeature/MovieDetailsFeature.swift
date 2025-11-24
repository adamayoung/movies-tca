//
//  MovieDetailsFeature.swift
//  MovieDetailsFeature
//
//  Created by Adam Young on 17/11/2025.
//

import ComposableArchitecture
import Foundation

@Reducer
public struct MovieDetailsFeature: Sendable {

    @Dependency(\.movieDetails) var movieDetails: MovieDetailsClient

    @ObservableState
    public struct State {
        var movieID: Int
        public let transitionID: String?
        var movie: Movie?
        var isLoading: Bool

        public init(
            movieID: Int,
            transitionID: String? = nil,
            movie: Movie? = nil,
            isLoading: Bool = false
        ) {
            self.movieID = movieID
            self.transitionID = transitionID
            self.movie = movie
            self.isLoading = isLoading
        }
    }

    public enum Action {
        case loadMovie
        case movieLoaded(Movie)
    }

    public init() {}

    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .loadMovie:
                state.isLoading = true
                return handleFetchMovie(&state)

            case .movieLoaded(let movie):
                state.isLoading = false
                state.movie = movie
                return .none
            }
        }
    }

}

extension MovieDetailsFeature {

    fileprivate func handleFetchMovie(_ state: inout State) -> EffectOf<Self> {
        let id = state.movieID

        return .run { send in
            do {
                let movie = try await movieDetails.fetch(id)
                await send(.movieLoaded(movie))
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
}

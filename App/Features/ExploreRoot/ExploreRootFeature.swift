//
//  ExploreRootFeature.swift
//  MoviesTCA
//
//  Created by Adam Young on 21/11/2025.
//

import ComposableArchitecture
import Foundation
import ExploreFeature
import MovieDetailsFeature
import TVSeriesDetailsFeature
import PersonDetailsFeature

@Reducer
struct ExploreRootFeature {

    @ObservableState
    struct State {
        var path = StackState<Path.State>()
        var explore = ExploreFeature.State()
    }

    @Reducer
    enum Path {
        case movieDetails(MovieDetailsFeature)
        case tvSeriesDetails(TVSeriesDetailsFeature)
        case personDetails(PersonDetailsFeature)
    }

    enum Action {
        case explore(ExploreFeature.Action)
        case path(StackActionOf<Path>)
    }

    var body: some Reducer<State, Action> {
        Scope(state: \.explore, action: \.explore) {
            ExploreFeature()
        }

        Reduce { state, action in
            switch action {
            case .explore(.navigate(.movieDetails(let id))):
                state.path.append(.movieDetails(MovieDetailsFeature.State(id: id)))
                return .none
            case .explore(.navigate(.tvSeriesDetails(let id))):
                state.path.append(.tvSeriesDetails(TVSeriesDetailsFeature.State(id: id)))
                return .none
            case .explore(.navigate(.personDetails(let id))):
                state.path.append(.personDetails(PersonDetailsFeature.State(id: id)))
                return .none
            default:
                return .none
            }
        }
        .forEach(\.path, action: \.path)
    }

}

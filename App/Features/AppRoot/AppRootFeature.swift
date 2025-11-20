//
//  AppRootFeature.swift
//  MoviesTCA
//
//  Created by Adam Young on 17/11/2025.
//

import ComposableArchitecture
import Foundation

@Reducer
struct AppRootFeature {

    @ObservableState
    struct State {
        var selectedTab: Tab = .movies
        var movies = MoviesRootFeature.State()
        var tvSeries = TVSeriesRootFeature.State()
        var people = PeopleRootFeature.State()
    }

    enum Tab {
        case movies
        case tvSeries
        case people
    }

    enum Action: BindableAction {
        case binding(BindingAction<State>)
        case movies(MoviesRootFeature.Action)
        case tvSeries(TVSeriesRootFeature.Action)
        case people(PeopleRootFeature.Action)
    }

    var body: some Reducer<State, Action> {
        BindingReducer()
        Scope(state: \.movies, action: \.movies) { MoviesRootFeature() }
        Scope(state: \.tvSeries, action: \.tvSeries) { TVSeriesRootFeature() }
        Scope(state: \.people, action: \.people) { PeopleRootFeature() }
    }

}

extension AppRootFeature.Tab: @nonisolated Equatable, @nonisolated Hashable {}

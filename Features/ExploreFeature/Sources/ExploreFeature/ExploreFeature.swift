//
//  ExploreFeature.swift
//  ExploreFeature
//
//  Created by Adam Young on 21/11/2025.
//

import ComposableArchitecture
import Foundation

@Reducer
public struct ExploreFeature: Sendable {
    
    @Dependency(\.explore) private var explore: ExploreClient
    
    @ObservableState
    public struct State {
        public struct MoviesCollectionState {
            var movies: [MoviePreview]
            var isLoading: Bool
            var isInitiallyLoading: Bool {
                movies.isEmpty && isLoading
            }

            public init(
                movies: [MoviePreview] = [],
                isLoading: Bool = false
            ) {
                self.movies = movies
                self.isLoading = isLoading
            }
        }
        
        public struct TVSeriesCollectionState {
            var tvSeries: [TVSeriesPreview]
            var isLoading: Bool
            var isInitiallyLoading: Bool {
                tvSeries.isEmpty && isLoading
            }

            public init(
                tvSeries: [TVSeriesPreview] = [],
                isLoading: Bool = false
            ) {
                self.tvSeries = tvSeries
                self.isLoading = isLoading
            }
        }
        
        public struct PeopleCollectionState {
            var people: [PersonPreview]
            var isLoading: Bool
            var isInitiallyLoading: Bool {
                people.isEmpty && isLoading
            }

            public init(
                people: [PersonPreview] = [],
                isLoading: Bool = false
            ) {
                self.people = people
                self.isLoading = isLoading
            }
        }
        
        var trendingMovies: MoviesCollectionState
        var popularMovies: MoviesCollectionState
        var trendingTVSeries: TVSeriesCollectionState
        var trendingPeople: PeopleCollectionState
        var isInitiallyLoading: Bool {
            trendingMovies.isInitiallyLoading
            && popularMovies.isInitiallyLoading
            && trendingTVSeries.isInitiallyLoading
            && trendingPeople.isInitiallyLoading
        }

        public init(
            trendingMovies: MoviesCollectionState = .init(),
            popularMovies: MoviesCollectionState = .init(),
            trendingTVSeries: TVSeriesCollectionState = .init(),
            trendingPeople: PeopleCollectionState = .init()
        ) {
            self.trendingMovies = trendingMovies
            self.popularMovies = popularMovies
            self.trendingTVSeries = trendingTVSeries
            self.trendingPeople = trendingPeople
        }
    }
    
    public enum Action {
        case load
        case trendingMoviesLoaded([MoviePreview])
        case popularMoviesLoaded([MoviePreview])
        case trendingTVSeriesLoaded([TVSeriesPreview])
        case trendingPeopleLoaded([PersonPreview])
        case navigate(Navigation)
    }
    
    public enum Navigation: Equatable, Hashable {
        case movieDetails(id: Int, transitionID: String? = nil)
        case tvSeriesDetails(id: Int, transitionID: String? = nil)
        case personDetails(id: Int, transitionID: String? = nil)
    }
 
    public init() {}
    
    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .load:
                state.trendingMovies.isLoading = true
                state.popularMovies.isLoading = true
                state.trendingTVSeries.isLoading = true
                state.trendingPeople.isLoading = true
                return handleFetchAll()
            case .trendingMoviesLoaded(let movies):
                state.trendingMovies.movies = movies
                state.trendingMovies.isLoading = false
                return .none
            case .popularMoviesLoaded(let movies):
                state.popularMovies.movies = movies
                state.popularMovies.isLoading = false
                return .none
            case .trendingTVSeriesLoaded(let tvSeries):
                state.trendingTVSeries.tvSeries = tvSeries
                state.trendingTVSeries.isLoading = false
                return .none
            case .trendingPeopleLoaded(let people):
                state.trendingPeople.people = people
                state.trendingPeople.isLoading = false
                return .none
            case .navigate:
                return .none
            }
        }
    }
    
}

extension ExploreFeature {
    
    private func handleFetchAll() -> EffectOf<Self> {
        .merge(
            handleFetchTrendingMovies(),
            handleFetchPopularMovies(),
            handleFetchTrendingTVSeries(),
            handleFetchTrendingPeople()
        )
    }
    
    private func handleFetchTrendingMovies() -> EffectOf<Self> {
        .run { send in
            do {
                let movies = try await explore.fetchTrendingMovies()
                await send(.trendingMoviesLoaded(movies))
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func handleFetchPopularMovies() -> EffectOf<Self> {
        .run { send in
            do {
                let movies = try await explore.fetchPopularMovies()
                await send(.popularMoviesLoaded(movies))
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func handleFetchTrendingTVSeries() -> EffectOf<Self> {
        .run { send in
            do {
                let tvSeries = try await explore.fetchTrendingTVSeries()
                await send(.trendingTVSeriesLoaded(tvSeries))
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    private func handleFetchTrendingPeople() -> EffectOf<Self> {
        .run { send in
            do {
                let people = try await explore.fetchTrendingPeople()
                await send(.trendingPeopleLoaded(people))
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
}

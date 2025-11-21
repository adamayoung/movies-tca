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
        public struct TrendingMoviesState {
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
        
        public struct TrendingTVSeriesState {
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
        
        public struct TrendingPeopleState {
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
        
        var trendingMovies: TrendingMoviesState
        var trendingTVSeries: TrendingTVSeriesState
        var trendingPeople: TrendingPeopleState
        var isInitiallyLoading: Bool {
            trendingMovies.isInitiallyLoading && trendingTVSeries.isInitiallyLoading && trendingPeople.isInitiallyLoading
        }

        public init(
            trendingMovies: TrendingMoviesState = .init(),
            trendingTVSeries: TrendingTVSeriesState = .init(),
            trendingPeople: TrendingPeopleState = .init()
        ) {
            self.trendingMovies = trendingMovies
            self.trendingTVSeries = trendingTVSeries
            self.trendingPeople = trendingPeople
        }
    }
    
    public enum Action {
        case load
        case trendingMoviesLoaded([MoviePreview])
        case trendingTVSeriesLoaded([TVSeriesPreview])
        case trendingPeopleLoaded([PersonPreview])
        case navigate(Navigation)
    }
    
    public enum Navigation: Equatable, Hashable {
        case movieDetails(id: Int)
        case tvSeriesDetails(id: Int)
        case personDetails(id: Int)
    }
    
    public init() {}
    
    public var body: some Reducer<State, Action> {
        Reduce { state, action in
            switch action {
            case .load:
                state.trendingMovies.isLoading = true
                state.trendingTVSeries.isLoading = true
                state.trendingPeople.isLoading = true
                return handleFetchAll()
            case .trendingMoviesLoaded(let movies):
                state.trendingMovies.movies = movies
                state.trendingMovies.isLoading = false
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
            .run { send in
                do {
                    let movies = try await explore.fetchTrendingMovies()
                    await send(.trendingMoviesLoaded(movies))
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            },
            .run { send in
                do {
                    let tvSeries = try await explore.fetchTrendingTVSeries()
                    await send(.trendingTVSeriesLoaded(tvSeries))
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            },
            .run { send in
                do {
                    let people = try await explore.fetchTrendingPeople()
                    await send(.trendingPeopleLoaded(people))
                } catch {
                    print("Error: \(error.localizedDescription)")
                }
            }
        )
    }
    
}

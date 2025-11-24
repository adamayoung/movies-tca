//
//  FetchTrendingMoviesUseCase+TCA.swift
//  TrendingAdapters
//
//  Created by Adam Young on 18/11/2025.
//

import ComposableArchitecture
import ConfigurationApplication
import Foundation
import MoviesApplication
import TVApplication
import TMDbAdapters
import TrendingApplication

enum FetchTrendingMoviesUseCaseKey: DependencyKey {

    static var liveValue: any FetchTrendingMoviesUseCase {
        let configurationService = DependencyValues._current.configurationService
        let fetchAppConfigurationUseCase = ConfigurationComposition
            .makeConfigurationContainer(configurationService: configurationService)
            .makeFetchAppConfigurationUseCase()
        let trendingAppConfigurationProvider = TrendingAppConfigurationProviderAdapter(fetchUseCase: fetchAppConfigurationUseCase)
        let moviesAppConfigurationProvider = MoviesAppConfigurationProviderAdapter(fetchUseCase: fetchAppConfigurationUseCase)
        let tvAppConfigurationProvider = TVAppConfigurationProviderAdapter(fetchUseCase: fetchAppConfigurationUseCase)
        
        let movieService = DependencyValues._current.movieService
        let fetchMovieImageCollectionUseCase = MoviesComposition
            .makeMoviesContainer(
                movieService: movieService,
                appConfigurationProvider: moviesAppConfigurationProvider
            )
            .makeFetchMovieImageCollectionUseCase()
        let movieLogoImageProvider = MovieLogoImageProviderAdapter(fetchImageCollectionUseCase: fetchMovieImageCollectionUseCase)
        
        let tvSeriesService = DependencyValues._current.tvSeriesService
        let fetchTVSeriesImageCollectionUseCase = TVComposition
            .makeTVContainer(
                tvSeriesService: tvSeriesService,
                appConfigurationProvider: tvAppConfigurationProvider
            )
            .makeFetchTVSeriesImageCollectionUseCase()
        let tvSeriesLogoImageProvider = TVSeriesLogoImageProviderAdapter(fetchImageCollectionUseCase: fetchTVSeriesImageCollectionUseCase)

        let trendingService = DependencyValues._current.trendingService
        let useCase = TrendingComposition
            .makeTrendingContainer(
                trendingService: trendingService,
                appConfigurationProvider: trendingAppConfigurationProvider,
                movieLogoImageProvider: movieLogoImageProvider,
                tvSeriesLogoImageProvider: tvSeriesLogoImageProvider
            )
            .makeFetchTrendingMoviesUseCase()

        return useCase
    }

}

extension DependencyValues {

    public var fetchTrendingMovies: any FetchTrendingMoviesUseCase {
        get { self[FetchTrendingMoviesUseCaseKey.self] }
        set { self[FetchTrendingMoviesUseCaseKey.self] = newValue }
    }

}

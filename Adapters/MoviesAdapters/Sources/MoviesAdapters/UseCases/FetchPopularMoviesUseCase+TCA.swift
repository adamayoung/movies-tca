//
//  FetchPopularMoviesUseCase+TCA.swift
//  MoviesAdapters
//
//  Created by Adam Young on 21/11/2025.
//

import ComposableArchitecture
import ConfigurationApplication
import Foundation
import MoviesApplication
import TMDbAdapters

enum FetchPopularMoviesUseCaseKey: DependencyKey {

    static var liveValue: any FetchPopularMoviesUseCase {
        let configurationService = DependencyValues._current.configurationService
        let fetchAppConfigurationUseCase = ConfigurationComposition
            .makeConfigurationContainer(configurationService: configurationService)
            .makeFetchAppConfigurationUseCase()
        let appConfigurationProvider = AppConfigurationProviderAdapter(fetchUseCase: fetchAppConfigurationUseCase)

        let movieService = DependencyValues._current.movieService
        let useCase = MoviesComposition
            .makeMoviesContainer(
                movieService: movieService,
                appConfigurationProvider: appConfigurationProvider
            )
            .makeFetchPopularMoviesUseCase()

        return useCase
    }

}

extension DependencyValues {

    public var fetchPopularMovies: any FetchPopularMoviesUseCase {
        get { self[FetchPopularMoviesUseCaseKey.self] }
        set { self[FetchPopularMoviesUseCaseKey.self] = newValue }
    }

}

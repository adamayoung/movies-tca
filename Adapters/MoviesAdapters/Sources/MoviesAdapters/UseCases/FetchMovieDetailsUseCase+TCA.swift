//
//  FetchMovieDetailsUseCase+TCA.swift
//  MoviesAdapters
//
//  Created by Adam Young on 18/11/2025.
//

import ComposableArchitecture
import ConfigurationApplication
import Foundation
import MoviesApplication
import TMDbAdapters

enum FetchMovieDetailsUseCaseKey: DependencyKey {

    static var liveValue: any FetchMovieDetailsUseCase {
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
            .makeFetchMovieDetailsUseCase()

        return useCase
    }

}

extension DependencyValues {

    public var fetchMovieDetails: any FetchMovieDetailsUseCase {
        get { self[FetchMovieDetailsUseCaseKey.self] }
        set { self[FetchMovieDetailsUseCaseKey.self] = newValue }
    }

}

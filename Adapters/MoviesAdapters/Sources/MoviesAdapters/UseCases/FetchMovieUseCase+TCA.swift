//
//  FetchMovieUseCase+TCA.swift
//  MoviesAdapters
//
//  Created by Adam Young on 18/11/2025.
//

import ComposableArchitecture
import ConfigurationApplication
import ConfigurationInfrastructure
import Foundation
import MoviesApplication
import TMDbAdapters

enum FetchMovieUseCaseKey: DependencyKey {

    static var liveValue: any FetchMovieUseCase {
        let configurationService = DependencyValues._current.configurationService
        let configurationContainer = ConfigurationContainer(
            configurationService: configurationService
        )
        let appConfigurationProvider = configurationContainer.makeAppConfigurationProvider()

        let movieService = DependencyValues._current.movieService
        let moviesContainer = MoviesContainer(
            movieService: movieService,
            appConfigurationProvider: appConfigurationProvider
        )

        return moviesContainer.makeFetchMovieUseCase()
    }

}

extension DependencyValues {

    public var fetchMovie: any FetchMovieUseCase {
        get { self[FetchMovieUseCaseKey.self] }
        set { self[FetchMovieUseCaseKey.self] = newValue }
    }

}

//
//  FetchTrendingMoviesUseCase+TCA.swift
//  TrendingAdapters
//
//  Created by Adam Young on 18/11/2025.
//

import ComposableArchitecture
import ConfigurationApplication
import Foundation
import TMDbAdapters
import TrendingApplication

enum FetchTrendingMoviesUseCaseKey: DependencyKey {

    static var liveValue: any FetchTrendingMoviesUseCase {
        let configurationService = DependencyValues._current.configurationService
        let configurationContainer = ConfigurationContainer(
            configurationService: configurationService
        )
        let appConfigurationProvider = configurationContainer.makeAppConfigurationProvider()

        let trendingService = DependencyValues._current.trendingService
        let container = TrendingContainer(
            trendingService: trendingService,
            appConfigurationProvider: appConfigurationProvider
        )

        return container.makeFetchTrendingMoviesUseCase()
    }

}

extension DependencyValues {

    public var fetchTrendingMovies: any FetchTrendingMoviesUseCase {
        get { self[FetchTrendingMoviesUseCaseKey.self] }
        set { self[FetchTrendingMoviesUseCaseKey.self] = newValue }
    }

}

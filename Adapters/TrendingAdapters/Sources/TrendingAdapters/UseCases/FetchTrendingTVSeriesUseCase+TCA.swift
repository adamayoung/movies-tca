//
//  FetchTrendingTVSeriesUseCase+TCA.swift
//  TrendingAdapters
//
//  Created by Adam Young on 18/11/2025.
//

import ComposableArchitecture
import ConfigurationApplication
import Foundation
import TMDbAdapters
import TrendingApplication

enum FetchTrendingTVSeriesUseCaseKey: DependencyKey {

    static var liveValue: any FetchTrendingTVSeriesUseCase {
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

        return container.makeFetchTrendingTVSeriesUseCase()
    }

}

extension DependencyValues {

    public var fetchTrendingTVSeries: any FetchTrendingTVSeriesUseCase {
        get { self[FetchTrendingTVSeriesUseCaseKey.self] }
        set { self[FetchTrendingTVSeriesUseCaseKey.self] = newValue }
    }

}

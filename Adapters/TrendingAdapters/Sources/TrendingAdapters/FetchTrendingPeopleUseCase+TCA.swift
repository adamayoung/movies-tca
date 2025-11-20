//
//  FetchTrendingPeopleUseCase+TCA.swift
//  TrendingAdapters
//
//  Created by Adam Young on 18/11/2025.
//

import ComposableArchitecture
import ConfigurationApplication
import Foundation
import TMDbAdapters
import TrendingApplication

enum FetchTrendingPeopleUseCaseKey: DependencyKey {

    static var liveValue: any FetchTrendingPeopleUseCase {
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

        return container.makeFetchTrendingPeopleUseCase()
    }

}

extension DependencyValues {

    public var fetchTrendingPeople: any FetchTrendingPeopleUseCase {
        get { self[FetchTrendingPeopleUseCaseKey.self] }
        set { self[FetchTrendingPeopleUseCaseKey.self] = newValue }
    }

}

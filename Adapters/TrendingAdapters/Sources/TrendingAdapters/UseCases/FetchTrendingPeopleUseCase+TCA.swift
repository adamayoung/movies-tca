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
        let fetchAppConfigurationUseCase = ConfigurationComposition
            .makeConfigurationContainer(configurationService: configurationService)
            .makeFetchAppConfigurationUseCase()
        let appConfigurationProvider = AppConfigurationProviderAdapter(fetchUseCase: fetchAppConfigurationUseCase)

        let trendingService = DependencyValues._current.trendingService
        let useCase = TrendingComposition
            .makeTrendingContainer(
                trendingService: trendingService,
                appConfigurationProvider: appConfigurationProvider
            )
            .makeFetchTrendingPeopleUseCase()

        return useCase
    }

}

extension DependencyValues {

    public var fetchTrendingPeople: any FetchTrendingPeopleUseCase {
        get { self[FetchTrendingPeopleUseCaseKey.self] }
        set { self[FetchTrendingPeopleUseCaseKey.self] = newValue }
    }

}

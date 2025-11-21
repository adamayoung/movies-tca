//
//  FetchTVSeriesDetailsUseCase+TCA.swift
//  TVAdapters
//
//  Created by Adam Young on 18/11/2025.
//

import ComposableArchitecture
import ConfigurationApplication
import Foundation
import TMDbAdapters
import TVApplication

enum FetchTVSeriesDetailsUseCaseKey: DependencyKey {

    static var liveValue: any FetchTVSeriesDetailsUseCase {
        let configurationService = DependencyValues._current.configurationService
        let fetchAppConfigurationUseCase = ConfigurationComposition
            .makeConfigurationContainer(configurationService: configurationService)
            .makeFetchAppConfigurationUseCase()
        let appConfigurationProvider = AppConfigurationProviderAdapter(fetchUseCase: fetchAppConfigurationUseCase)

        let tvSeriesService = DependencyValues._current.tvSeriesService
        let useCase = TVComposition
            .makeTVContainer(
                tvSeriesService: tvSeriesService,
                appConfigurationProvider: appConfigurationProvider
            )
            .makeFetchTVSeriesDetailsUseCase()

        return useCase
    }

}

extension DependencyValues {

    public var fetchTVSeriesDetails: any FetchTVSeriesDetailsUseCase {
        get { self[FetchTVSeriesDetailsUseCaseKey.self] }
        set { self[FetchTVSeriesDetailsUseCaseKey.self] = newValue }
    }

}

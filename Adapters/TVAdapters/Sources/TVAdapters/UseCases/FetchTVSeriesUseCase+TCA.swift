//
//  FetchTVSeriesUseCase+TCA.swift
//  TVAdapters
//
//  Created by Adam Young on 18/11/2025.
//

import ComposableArchitecture
import ConfigurationApplication
import Foundation
import TMDbAdapters
import TVApplication

enum FetchTVSeriesUseCaseKey: DependencyKey {

    static var liveValue: any FetchTVSeriesUseCase {
        let configurationService = DependencyValues._current.configurationService
        let configurationContainer = ConfigurationContainer(
            configurationService: configurationService
        )
        let appConfigurationProvider = configurationContainer.makeAppConfigurationProvider()

        let tvSeriesService = DependencyValues._current.tvSeriesService
        let container = TVContainer(
            tvSeriesService: tvSeriesService,
            appConfigurationProvider: appConfigurationProvider
        )

        return container.makeFetchTVSeriesUseCase()
    }

}

extension DependencyValues {

    public var fetchTVSeries: any FetchTVSeriesUseCase {
        get { self[FetchTVSeriesUseCaseKey.self] }
        set { self[FetchTVSeriesUseCaseKey.self] = newValue }
    }

}

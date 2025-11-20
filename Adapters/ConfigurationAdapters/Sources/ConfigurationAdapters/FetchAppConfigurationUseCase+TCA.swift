//
//  FetchAppConfigurationUseCase+TCA.swift
//  ConfigurationAdapters
//
//  Created by Adam Young on 18/11/2025.
//

import ComposableArchitecture
import ConfigurationApplication
import ConfigurationInfrastructure
import Foundation
import TMDbAdapters

enum FetchAppConfigurationUseCaseKey: DependencyKey {

    static var liveValue: any FetchAppConfigurationUseCase {
        let configurationService = DependencyValues._current.configurationService
        let container = ConfigurationContainer(configurationService: configurationService)

        return container.makeFetchAppConfigurationUseCase()
    }

}

extension DependencyValues {

    public var fetchAppConfiguration: any FetchAppConfigurationUseCase {
        get { self[FetchAppConfigurationUseCaseKey.self] }
        set { self[FetchAppConfigurationUseCaseKey.self] = newValue }
    }

}

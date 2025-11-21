//
//  FetchPersonDetailsUseCase+TCA.swift
//  PeopleAdapters
//
//  Created by Adam Young on 19/11/2025.
//

import ComposableArchitecture
import ConfigurationApplication
import Foundation
import PeopleApplication
import TMDbAdapters

enum FetchPersonDetailsUseCaseKey: DependencyKey {

    static var liveValue: any FetchPersonDetailsUseCase {
        let configurationService = DependencyValues._current.configurationService
        let fetchAppConfigurationUseCase = ConfigurationComposition
            .makeConfigurationContainer(configurationService: configurationService)
            .makeFetchAppConfigurationUseCase()
        let appConfigurationProvider = AppConfigurationProviderAdapter(fetchUseCase: fetchAppConfigurationUseCase)

        let personService = DependencyValues._current.personService
        let useCase = PeopleComposition
            .makePeopleContainer(
                personService: personService,
                appConfigurationProvider: appConfigurationProvider
            )
            .makeFetchPersonDetailsUseCase()

        return useCase
    }

}

extension DependencyValues {

    public var fetchPersonDetails: any FetchPersonDetailsUseCase {
        get { self[FetchPersonDetailsUseCaseKey.self] }
        set { self[FetchPersonDetailsUseCaseKey.self] = newValue }
    }

}

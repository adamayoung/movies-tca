//
//  FetchPersonUseCase+TCA.swift
//  PeopleAdapters
//
//  Created by Adam Young on 19/11/2025.
//

import ComposableArchitecture
import ConfigurationApplication
import Foundation
import PeopleApplication
import TMDbAdapters

enum FetchPersonUseCaseKey: DependencyKey {

    static var liveValue: any FetchPersonUseCase {
        let configurationService = DependencyValues._current.configurationService
        let configurationContainer = ConfigurationContainer(
            configurationService: configurationService
        )
        let appConfigurationProvider = configurationContainer.makeAppConfigurationProvider()

        let personService = DependencyValues._current.personService
        let peopleContainer = PeopleContainer(
            personService: personService,
            appConfigurationProvider: appConfigurationProvider
        )

        return peopleContainer.makeFetchPersonUseCase()
    }

}

extension DependencyValues {

    public var fetchPerson: any FetchPersonUseCase {
        get { self[FetchPersonUseCaseKey.self] }
        set { self[FetchPersonUseCaseKey.self] = newValue }
    }

}

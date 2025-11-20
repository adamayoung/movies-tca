//
//  PeopleContainer.swift
//  PeopleKit
//
//  Created by Adam Young on 15/10/2025.
//

import Foundation
import PeopleDomain
import PeopleInfrastructure
import TMDb

public final class PeopleContainer {

    private let personService: any PersonService
    private let appConfigurationProvider: any AppConfigurationProviding

    public init(
        personService: some PersonService,
        appConfigurationProvider: some AppConfigurationProviding
    ) {
        self.personService = personService
        self.appConfigurationProvider = appConfigurationProvider
    }

    public func makeFetchPersonUseCase() -> some FetchPersonUseCase {
        let repository = makePersonRepository()

        return DefaultFetchPersonUseCase(repository: repository)
    }

}

extension PeopleContainer {

    private func makePersonRepository() -> PersonRepository {
        PeopleInfrastructureContainer.makePersonRepository(
            personService: personService,
            appConfigurationProvider: appConfigurationProvider
        )
    }

}

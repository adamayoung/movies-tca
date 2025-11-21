//
//  PeopleComposition.swift
//  MoviesKit
//
//  Created by Adam Young on 20/11/2025.
//

import Foundation
import PeopleDomain
import PeopleInfrastructure
import TMDb

public struct PeopleComposition {

    private init() {}

    public static func makePeopleContainer(
        personService: some PersonService,
        appConfigurationProvider: some AppConfigurationProviding
    ) -> PeopleContainer {
        let personRepository = PeopleInfrastructureContainer.makePersonRepository(personService: personService)
        
        return PeopleContainer(
            personRepository: personRepository,
            appConfigurationProvider: appConfigurationProvider
        )
    }

}

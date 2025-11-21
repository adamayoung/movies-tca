//
//  PeopleInfrastructureContainer.swift
//  PeopleKit
//
//  Created by Adam Young on 18/11/2025.
//

import Foundation
import PeopleDomain
import TMDb

package final class PeopleInfrastructureContainer {

    private init() {}

    package static func makePersonRepository(
        personService: some PersonService
    ) -> some PersonRepository {
        let remoteDataSource = Self.makePersonRemoteDataSource(personService: personService)

        return DefaultPersonRepository(remoteDataSource: remoteDataSource)
    }

}

extension PeopleInfrastructureContainer {

    private static func makePersonRemoteDataSource(
        personService: some PersonService
    ) -> some PersonRemoteDataSource {
        TMDbPersonRemoteDataSource(personService: personService)
    }

}

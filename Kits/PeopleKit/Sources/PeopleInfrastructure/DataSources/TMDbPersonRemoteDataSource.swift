//
//  TMDbPersonRemoteDataSource.swift
//  PeopleKit
//
//  Created by Adam Young on 18/11/2025.
//

import CoreDomain
import Foundation
import PeopleDomain
import TMDb

final class TMDbPersonRemoteDataSource: PersonRemoteDataSource {

    private let personService: any TMDb.PersonService
    private let appConfigurationProvider: any AppConfigurationProvider

    init(
        personService: some TMDb.PersonService,
        appConfigurationProvider: some AppConfigurationProvider
    ) {
        self.personService = personService
        self.appConfigurationProvider = appConfigurationProvider
    }

    func person(withID id: Int) async throws(PersonRepositoryError) -> PeopleDomain.Person {
        let tmdbPerson: TMDb.Person
        do {
            tmdbPerson = try await personService.details(forPerson: id, language: "en")
        } catch let error {
            throw PersonRepositoryError(error)
        }

        let imagesConfiguration: CoreDomain.ImagesConfiguration
        do {
            imagesConfiguration = try await appConfigurationProvider.appConfiguration().images
        } catch let error {
            throw PersonRepositoryError(error)
        }

        let mapper = PersonMapper(imagesConfiguration: imagesConfiguration)
        let movie = mapper.map(tmdbPerson)

        return movie
    }

}

extension PersonRepositoryError {

    fileprivate init(_ error: Error) {
        guard let error = error as? TMDbError else {
            self = .unknown(error)
            return
        }

        self.init(error)
    }

    fileprivate init(_ error: TMDbError) {
        switch error {
        case .notFound:
            self = .notFound
        case .unauthorised:
            self = .unauthorised
        default:
            self = .unknown(error)
        }
    }

}

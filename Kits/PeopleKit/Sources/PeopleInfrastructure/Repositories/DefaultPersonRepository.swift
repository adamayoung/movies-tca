//
//  DefaultPersonRepository.swift
//  PeopleKit
//
//  Created by Adam Young on 28/05/2025.
//

import Foundation
import PeopleDomain
import TMDb

final class DefaultPersonRepository: PersonRepository {

    private let remoteDataSource: any PersonRemoteDataSource

    init(remoteDataSource: some PersonRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func person(withID id: Int) async throws(PersonRepositoryError) -> PeopleDomain.Person {
        let person = try await remoteDataSource.person(withID: id)
        return person
    }

}

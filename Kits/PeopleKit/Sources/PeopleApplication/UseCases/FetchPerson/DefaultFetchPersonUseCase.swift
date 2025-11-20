//
//  DefaultFetchPersonUseCase.swift
//  PeopleKit
//
//  Created by Adam Young on 03/06/2025.
//

import Foundation
import PeopleDomain

final class DefaultFetchPersonUseCase: FetchPersonUseCase {

    private let repository: any PersonRepository

    init(repository: some PersonRepository) {
        self.repository = repository
    }

    func execute(id: Person.ID) async throws(FetchPersonError) -> Person {
        let person: Person
        do {
            person = try await repository.person(withID: id)
        } catch let error {
            throw FetchPersonError(error)
        }

        return person
    }

}

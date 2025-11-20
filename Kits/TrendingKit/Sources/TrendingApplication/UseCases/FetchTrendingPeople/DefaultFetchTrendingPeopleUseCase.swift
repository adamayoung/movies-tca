//
//  FetchTrendingPeople.swift
//  TrendingKit
//
//  Created by Adam Young on 09/06/2025.
//

import CoreDomain
import Foundation
import TrendingDomain

final class DefaultFetchTrendingPeopleUseCase: FetchTrendingPeopleUseCase {

    private let repository: any TrendingRepository

    init(repository: some TrendingRepository) {
        self.repository = repository
    }

    func execute() async throws(FetchTrendingPeopleError) -> [PersonListItem] {
        try await execute(page: 1)
    }

    func execute(page: Int) async throws(FetchTrendingPeopleError) -> [PersonListItem] {
        let people: [PersonListItem]
        do {
            people = try await repository.people(page: page)
        } catch let error {
            throw FetchTrendingPeopleError(error)
        }

        return people
    }

}

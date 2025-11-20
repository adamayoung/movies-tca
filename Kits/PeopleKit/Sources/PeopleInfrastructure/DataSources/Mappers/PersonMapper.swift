//
//  MovieMapper.swift
//  PeopleKit
//
//  Created by Adam Young on 29/05/2025.
//

import CoreDomain
import Foundation
import PeopleDomain
import TMDb

struct PersonMapper {

    private let imagesConfiguration: CoreDomain.ImagesConfiguration

    init(imagesConfiguration: CoreDomain.ImagesConfiguration) {
        self.imagesConfiguration = imagesConfiguration
    }

    func map(_ tmdbPerson: TMDb.Person) -> PeopleDomain.Person {
        let profileURLSet = imagesConfiguration.profileURL(for: tmdbPerson.profilePath)

        return PeopleDomain.Person(
            id: tmdbPerson.id,
            name: tmdbPerson.name,
            knownForDepartment: tmdbPerson.knownForDepartment ?? "",
            gender: map(tmdbPerson.gender),
            profileURLSet: profileURLSet
        )
    }

    private func map(_ gender: TMDb.Gender) -> CoreDomain.Gender {
        switch gender {
        case .unknown: .unknown
        case .female: .female
        case .male: .male
        case .other: .other
        }
    }

}

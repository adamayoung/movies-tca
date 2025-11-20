//
//  PersonListItemMapper.swift
//  TrendingKit
//
//  Created by Adam Young on 09/06/2025.
//

import CoreDomain
import Foundation
import TMDb
import TrendingDomain

struct PersonListItemMapper {

    private let imagesConfiguration: CoreDomain.ImagesConfiguration

    init(imagesConfiguration: CoreDomain.ImagesConfiguration) {
        self.imagesConfiguration = imagesConfiguration
    }

    func map(_ item: TMDb.PersonListItem) -> CoreDomain.PersonListItem {
        let profileURLSet = imagesConfiguration.profileURL(for: item.profilePath)

        return PersonListItem(
            id: item.id,
            name: item.name,
            knownForDepartment: item.knownForDepartment ?? "",
            gender: map(item.gender),
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

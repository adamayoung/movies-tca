//
//  TVSeriesListItemMapper.swift
//  TrendingKit
//
//  Created by Adam Young on 09/06/2025.
//

import CoreDomain
import Foundation
import TMDb
import TrendingDomain

struct TVSeriesListItemMapper {

    private let imagesConfiguration: CoreDomain.ImagesConfiguration

    init(imagesConfiguration: CoreDomain.ImagesConfiguration) {
        self.imagesConfiguration = imagesConfiguration
    }

    func map(_ item: TMDb.TVSeriesListItem) -> CoreDomain.TVSeriesListItem {
        let posterURLSet = imagesConfiguration.posterURLSet(for: item.posterPath)
        let backdropURLSet = imagesConfiguration.backdropURLSet(for: item.backdropPath)

        return TVSeriesListItem(
            id: item.id,
            name: item.name,
            overview: item.overview,
            posterURLSet: posterURLSet,
            backdropURLSet: backdropURLSet
        )
    }

}

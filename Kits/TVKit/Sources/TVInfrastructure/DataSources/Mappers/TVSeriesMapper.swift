//
//  TVSeriesMapper.swift
//  TVKit
//
//  Created by Adam Young on 29/05/2025.
//

import CoreDomain
import Foundation
import TMDb
import TVDomain

struct TVSeriesMapper {

    private let imagesConfiguration: CoreDomain.ImagesConfiguration

    init(imagesConfiguration: CoreDomain.ImagesConfiguration) {
        self.imagesConfiguration = imagesConfiguration
    }

    func map(_ tmdbTVSeries: TMDb.TVSeries) -> TVDomain.TVSeries {
        let posterURLSet = imagesConfiguration.posterURLSet(for: tmdbTVSeries.posterPath)
        let backdropURLSet = imagesConfiguration.backdropURLSet(for: tmdbTVSeries.backdropPath)

        return TVDomain.TVSeries(
            id: tmdbTVSeries.id,
            name: tmdbTVSeries.name,
            overview: tmdbTVSeries.overview,
            posterURLSet: posterURLSet,
            backdropURLSet: backdropURLSet
        )
    }

}

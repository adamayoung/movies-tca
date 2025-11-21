//
//  TVSeriesDetailsMapper.swift
//  TVKit
//
//  Created by Adam Young on 20/11/2025.
//

import CoreDomain
import Foundation
import TVDomain

struct TVSeriesDetailsMapper {

    func map(_ tvSeries: TVSeries, imagesConfiguration: ImagesConfiguration) -> TVSeriesDetails {
        let posterURLSet = imagesConfiguration.posterURLSet(for: tvSeries.posterPath)
        let backdropURLSet = imagesConfiguration.posterURLSet(for: tvSeries.backdropPath)

        return TVSeriesDetails(
            id: tvSeries.id,
            name: tvSeries.name,
            overview: tvSeries.overview,
            posterURLSet: posterURLSet,
            backdropURLSet: backdropURLSet
        )
    }

}

//
//  MovieListItemMapper.swift
//  TrendingKit
//
//  Created by Adam Young on 29/05/2025.
//

import CoreDomain
import Foundation
import TMDb
import TrendingDomain

struct MovieListItemMapper {

    private let imagesConfiguration: CoreDomain.ImagesConfiguration

    init(imagesConfiguration: CoreDomain.ImagesConfiguration) {
        self.imagesConfiguration = imagesConfiguration
    }

    func map(_ item: TMDb.MovieListItem) -> CoreDomain.MovieListItem {
        let posterURLSet = imagesConfiguration.posterURLSet(for: item.posterPath)
        let backdropURLSet = imagesConfiguration.backdropURLSet(for: item.backdropPath)

        return MovieListItem(
            id: item.id,
            title: item.title,
            overview: item.overview,
            posterURLSet: posterURLSet,
            backdropURLSet: backdropURLSet
        )
    }

}

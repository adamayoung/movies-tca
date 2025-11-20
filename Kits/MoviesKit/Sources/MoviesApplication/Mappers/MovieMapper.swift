//
//  MovieMapper.swift
//  MoviesKit
//
//  Created by Adam Young on 20/11/2025.
//

import CoreDomain
import Foundation
import MoviesDomain

struct MovieMapper {

    func map(_ entity: MovieEntity, imagesConfiguration: ImagesConfiguration) -> Movie {
        let posterURLSet = map(imagesConfiguration.posterURLSet(for: entity.posterPath))
        let backdropURLSet = map(imagesConfiguration.posterURLSet(for: entity.backdropPath))

        return Movie(
            id: entity.id,
            title: entity.title,
            overview: entity.overview,
            posterURLSet: posterURLSet,
            backdropURLSet: backdropURLSet

        )
    }

    private func map(_ imageSet: CoreDomain.ImageURLSet?) -> ImageURLSet? {
        guard let imageSet else {
            return nil
        }

        return ImageURLSet(
            thumbnail: imageSet.thumbnail,
            card: imageSet.card,
            detail: imageSet.detail,
            full: imageSet.full
        )
    }

}

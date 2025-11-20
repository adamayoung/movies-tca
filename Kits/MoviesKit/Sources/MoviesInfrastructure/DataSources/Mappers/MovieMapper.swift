//
//  MovieMapper.swift
//  MoviesKit
//
//  Created by Adam Young on 29/05/2025.
//

import CoreDomain
import Foundation
import MoviesDomain
import TMDb

struct MovieMapper {

    private let imagesConfiguration: CoreDomain.ImagesConfiguration

    init(imagesConfiguration: CoreDomain.ImagesConfiguration) {
        self.imagesConfiguration = imagesConfiguration
    }

    func map(_ tmdbMovie: TMDb.Movie) -> MoviesDomain.Movie {
        let posterURLSet = imagesConfiguration.posterURLSet(for: tmdbMovie.posterPath)
        let backdropURLSet = imagesConfiguration.backdropURLSet(for: tmdbMovie.backdropPath)

        return MoviesDomain.Movie(
            id: tmdbMovie.id,
            title: tmdbMovie.title,
            overview: tmdbMovie.overview,
            posterURLSet: posterURLSet,
            backdropURLSet: backdropURLSet
        )
    }

}

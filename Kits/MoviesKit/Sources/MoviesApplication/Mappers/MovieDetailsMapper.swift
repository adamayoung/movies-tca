//
//  MovieDetailsMapper.swift
//  MoviesKit
//
//  Created by Adam Young on 20/11/2025.
//

import CoreDomain
import Foundation
import MoviesDomain

struct MovieDetailsMapper {

    func map(_ movie: Movie, imagesConfiguration: ImagesConfiguration) -> MovieDetails {
        let posterURLSet = imagesConfiguration.posterURLSet(for: movie.posterPath)
        let backdropURLSet = imagesConfiguration.posterURLSet(for: movie.backdropPath)

        return MovieDetails(
            id: movie.id,
            title: movie.title,
            overview: movie.overview,
            posterURLSet: posterURLSet,
            backdropURLSet: backdropURLSet

        )
    }

}

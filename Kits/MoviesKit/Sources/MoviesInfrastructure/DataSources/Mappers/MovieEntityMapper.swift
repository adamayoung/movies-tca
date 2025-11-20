//
//  MovieEntityMapper.swift
//  MoviesKit
//
//  Created by Adam Young on 29/05/2025.
//

import Foundation
import MoviesDomain
import TMDb

struct MovieEntityMapper {

    func map(_ tmdbMovie: TMDb.Movie) -> MovieEntity {
        MovieEntity(
            id: tmdbMovie.id,
            title: tmdbMovie.title,
            overview: tmdbMovie.overview,
            posterPath: tmdbMovie.posterPath,
            backdropPath: tmdbMovie.backdropPath
        )
    }

}

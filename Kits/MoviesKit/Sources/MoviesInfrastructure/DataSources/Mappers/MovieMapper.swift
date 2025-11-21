//
//  MovieMapper.swift
//  MoviesKit
//
//  Created by Adam Young on 29/05/2025.
//

import Foundation
import MoviesDomain
import TMDb

struct MovieMapper {

    func map(_ tmdbMovie: TMDb.Movie) -> MoviesDomain.Movie {
        MoviesDomain.Movie(
            id: tmdbMovie.id,
            title: tmdbMovie.title,
            overview: tmdbMovie.overview,
            posterPath: tmdbMovie.posterPath,
            backdropPath: tmdbMovie.backdropPath
        )
    }

}

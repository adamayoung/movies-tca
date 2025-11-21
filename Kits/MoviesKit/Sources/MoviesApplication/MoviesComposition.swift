//
//  MoviesComposition.swift
//  MoviesKit
//
//  Created by Adam Young on 20/11/2025.
//

import Foundation
import MoviesDomain
import MoviesInfrastructure
import TMDb

public struct MoviesComposition {

    private init() {}

    public static func makeMoviesContainer(
        movieService: some MovieService,
        appConfigurationProvider: some AppConfigurationProviding
    ) -> MoviesContainer {
        let movieRepository = MoviesInfrastructureContainer.makeMovieRepository(movieService: movieService)
        
        return MoviesContainer(
            movieRepository: movieRepository,
            appConfigurationProvider: appConfigurationProvider
        )
    }

}

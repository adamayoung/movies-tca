//
//  MoviesInfrastructureContainer.swift
//  MoviesKit
//
//  Created by Adam Young on 18/11/2025.
//

import CoreInterfaces
import Foundation
import MoviesDomain
import TMDb

package final class MoviesInfrastructureContainer {

    private init() {}

    package static func makeMovieRepository(
        movieService: some MovieService,
        appConfigurationProvider: some AppConfigurationProvider
    ) -> some MovieRepository {
        let remoteDataSource = Self.makeMovieRemoteDataSource(
            movieService: movieService,
            appConfigurationProvider: appConfigurationProvider
        )

        return DefaultMovieRepository(remoteDataSource: remoteDataSource)
    }

}

extension MoviesInfrastructureContainer {

    private static func makeMovieRemoteDataSource(
        movieService: some MovieService,
        appConfigurationProvider: some AppConfigurationProvider
    ) -> some MovieRemoteDataSource {
        TMDbMovieRemoteDataSource(
            movieService: movieService,
            appConfigurationProvider: appConfigurationProvider
        )
    }

}

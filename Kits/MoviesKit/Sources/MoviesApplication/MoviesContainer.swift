//
//  MoviesContainer.swift
//  MoviesKit
//
//  Created by Adam Young on 15/10/2025.
//

import CoreInterfaces
import Foundation
import MoviesDomain
import MoviesInfrastructure
import TMDb

public final class MoviesContainer {

    private let movieService: any MovieService
    private let appConfigurationProvider: any AppConfigurationProvider

    public init(
        movieService: some MovieService,
        appConfigurationProvider: some AppConfigurationProvider
    ) {
        self.movieService = movieService
        self.appConfigurationProvider = appConfigurationProvider
    }

    public func makeFetchMovieUseCase() -> some FetchMovieUseCase {
        let repository = makeMovieRepository()

        return DefaultFetchMovieUseCase(repository: repository)
    }

}

extension MoviesContainer {

    private func makeMovieRepository() -> MovieRepository {
        MoviesInfrastructureContainer.makeMovieRepository(
            movieService: movieService,
            appConfigurationProvider: appConfigurationProvider
        )
    }

}

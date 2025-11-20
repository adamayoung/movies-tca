//
//  MoviesContainer.swift
//  MoviesKit
//
//  Created by Adam Young on 15/10/2025.
//

import Foundation
import MoviesDomain
import MoviesInfrastructure
import TMDb

public final class MoviesContainer {

    private let movieService: any MovieService
    private let appConfigurationProvider: any AppConfigurationProviding

    init(
        movieService: some MovieService,
        appConfigurationProvider: some AppConfigurationProviding
    ) {
        self.movieService = movieService
        self.appConfigurationProvider = appConfigurationProvider
    }

    public func makeFetchMovieUseCase() -> some FetchMovieUseCase {
        let repository = makeMovieRepository()

        return DefaultFetchMovieUseCase(
            repository: repository,
            appConfigurationProvider: appConfigurationProvider
        )
    }

}

extension MoviesContainer {

    private func makeMovieRepository() -> MovieRepository {
        MoviesInfrastructureContainer.makeMovieRepository(movieService: movieService)
    }

}

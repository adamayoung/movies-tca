//
//  MoviesContainer.swift
//  MoviesKit
//
//  Created by Adam Young on 15/10/2025.
//

import Foundation
import MoviesDomain

public final class MoviesContainer {

    private let movieRepository: any MovieRepository
    private let appConfigurationProvider: any AppConfigurationProviding

    init(
        movieRepository: some MovieRepository,
        appConfigurationProvider: some AppConfigurationProviding
    ) {
        self.movieRepository = movieRepository
        self.appConfigurationProvider = appConfigurationProvider
    }

    public func makeFetchMovieDetailsUseCase() -> some FetchMovieDetailsUseCase {
        DefaultFetchMovieDetailsUseCase(
            repository: movieRepository,
            appConfigurationProvider: appConfigurationProvider
        )
    }
    
    public func makeFetchMovieImageCollectionUseCase() -> some FetchMovieImageCollectionUseCase {
        DefaultFetchMovieImageCollectionUseCase(
            repository: movieRepository,
            appConfigurationProvider: appConfigurationProvider
        )
    }
    
    public func makeFetchPopularMoviesUseCase() -> some FetchPopularMoviesUseCase {
        DefaultFetchPopularMoviesUseCase(
            repository: movieRepository,
            appConfigurationProvider: appConfigurationProvider
        )
    }

}

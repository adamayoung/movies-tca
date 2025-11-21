//
//  DefaultFetchMovieDetailsUseCase.swift
//  MoviesKit
//
//  Created by Adam Young on 03/06/2025.
//

import CoreDomain
import Foundation
import MoviesDomain

final class DefaultFetchMovieDetailsUseCase: FetchMovieDetailsUseCase {

    private let repository: any MovieRepository
    private let appConfigurationProvider: any AppConfigurationProviding

    init(
        repository: some MovieRepository,
        appConfigurationProvider: some AppConfigurationProviding
    ) {
        self.repository = repository
        self.appConfigurationProvider = appConfigurationProvider
    }

    func execute(id: Movie.ID) async throws(FetchMovieDetailsError) -> MovieDetails {
        let movie: Movie
        let appConfiguration: AppConfiguration
        do {
            (movie, appConfiguration) = try await (
                repository.movie(withID: id),
                appConfigurationProvider.appConfiguration()
            )
        } catch let error {
            throw FetchMovieDetailsError(error)
        }

        let mapper = MovieDetailsMapper()
        let movieDetails = mapper.map(movie, imagesConfiguration: appConfiguration.images)

        return movieDetails
    }

}

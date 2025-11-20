//
//  DefaultFetchMovieUseCase.swift
//  MoviesKit
//
//  Created by Adam Young on 03/06/2025.
//

import CoreDomain
import Foundation
import MoviesDomain

final class DefaultFetchMovieUseCase: FetchMovieUseCase {

    private let repository: any MovieRepository
    private let appConfigurationProvider: any AppConfigurationProviding

    init(
        repository: some MovieRepository,
        appConfigurationProvider: some AppConfigurationProviding
    ) {
        self.repository = repository
        self.appConfigurationProvider = appConfigurationProvider
    }

    func execute(id: Movie.ID) async throws(FetchMovieError) -> Movie {
        let entity: MovieEntity
        let appConfiguration: AppConfiguration
        do {
            (entity, appConfiguration) = try await (
                repository.movie(withID: id),
                appConfigurationProvider.appConfiguration()
            )
        } catch let error {
            throw FetchMovieError(error)
        }

        let mapper = MovieMapper()
        let movie = mapper.map(entity, imagesConfiguration: appConfiguration.images)

        return movie
    }

}

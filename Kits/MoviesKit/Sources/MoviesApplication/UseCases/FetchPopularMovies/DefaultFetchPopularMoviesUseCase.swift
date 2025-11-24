//
//  DefaultFetchPopularMoviesUseCase.swift
//  MoviesKit
//
//  Created by Adam Young on 21/11/2025.
//

import CoreDomain
import Foundation
import MoviesDomain

final class DefaultFetchPopularMoviesUseCase: FetchPopularMoviesUseCase {

    private let repository: any MovieRepository
    private let appConfigurationProvider: any AppConfigurationProviding

    init(
        repository: some MovieRepository,
        appConfigurationProvider: some AppConfigurationProviding
    ) {
        self.repository = repository
        self.appConfigurationProvider = appConfigurationProvider
    }

    func execute() async throws(FetchPopularMoviesError) -> [MoviePreviewDetails] {
        try await execute(page: 1)
    }

    func execute(page: Int) async throws(FetchPopularMoviesError) -> [MoviePreviewDetails] {
        let moviePreviews: [MoviePreview]
        let appConfiguration: AppConfiguration
        do {
            (moviePreviews, appConfiguration) = try await (
                repository.popular(page: page),
                appConfigurationProvider.appConfiguration()
            )
        } catch let error {
            throw FetchPopularMoviesError(error)
        }
        
        let mapper = MoviePreviewDetailsMapper()
        let moviePreviewDetails = moviePreviews.map {
            mapper.map($0, imagesConfiguration: appConfiguration.images)
        }

        return moviePreviewDetails
    }

}

//
//  DefaultFetchTrendingMoviesUseCase.swift
//  TrendingKit
//
//  Created by Adam Young on 03/06/2025.
//

import CoreDomain
import Foundation
import TrendingDomain

final class DefaultFetchTrendingMoviesUseCase: FetchTrendingMoviesUseCase {

    private let repository: any TrendingRepository
    private let appConfigurationProvider: any AppConfigurationProviding

    init(
        repository: some TrendingRepository,
        appConfigurationProvider: some AppConfigurationProviding
    ) {
        self.repository = repository
        self.appConfigurationProvider = appConfigurationProvider
    }

    func execute() async throws(FetchTrendingMoviesError) -> [MoviePreviewDetails] {
        try await execute(page: 1)
    }

    func execute(page: Int) async throws(FetchTrendingMoviesError) -> [MoviePreviewDetails] {
        let moviePreviews: [MoviePreview]
        let appConfiguration: AppConfiguration
        do {
            (moviePreviews, appConfiguration) = try await (
                repository.movies(page: page),
                appConfigurationProvider.appConfiguration()
            )
        } catch let error {
            throw FetchTrendingMoviesError(error)
        }
        
        let mapper = MoviePreviewDetailsMapper()
        let moviePreviewDetails = moviePreviews.map {
            mapper.map($0, imagesConfiguration: appConfiguration.images)
        }

        return moviePreviewDetails
    }

}

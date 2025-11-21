//
//  MoviesContainer.swift
//  MoviesKit
//
//  Created by Adam Young on 15/10/2025.
//

import Foundation
import TrendingDomain

public final class TrendingContainer {

    private let trendingRepository: any TrendingRepository
    private let appConfigurationProvider: any AppConfigurationProviding

    init(
        trendingRepository: some TrendingRepository,
        appConfigurationProvider: some AppConfigurationProviding
    ) {
        self.trendingRepository = trendingRepository
        self.appConfigurationProvider = appConfigurationProvider
    }

    public func makeFetchTrendingMoviesUseCase() -> some FetchTrendingMoviesUseCase {
        DefaultFetchTrendingMoviesUseCase(
            repository: trendingRepository,
            appConfigurationProvider: appConfigurationProvider
        )
    }

    public func makeFetchTrendingTVSeriesUseCase() -> some FetchTrendingTVSeriesUseCase {
        DefaultFetchTrendingTVSeriesUseCase(
            repository: trendingRepository,
            appConfigurationProvider: appConfigurationProvider
        )
    }

    public func makeFetchTrendingPeopleUseCase() -> some FetchTrendingPeopleUseCase {
        DefaultFetchTrendingPeopleUseCase(
            repository: trendingRepository,
            appConfigurationProvider: appConfigurationProvider
        )
    }

}

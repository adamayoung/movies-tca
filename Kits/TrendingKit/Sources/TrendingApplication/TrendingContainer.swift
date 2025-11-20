//
//  MoviesContainer.swift
//  MoviesKit
//
//  Created by Adam Young on 15/10/2025.
//

import CoreInterfaces
import Foundation
import TMDb
import TrendingDomain
import TrendingInfrastructure

public final class TrendingContainer {

    private let trendingService: any TrendingService
    private let appConfigurationProvider: any AppConfigurationProvider

    public init(
        trendingService: some TrendingService,
        appConfigurationProvider: some AppConfigurationProvider
    ) {
        self.trendingService = trendingService
        self.appConfigurationProvider = appConfigurationProvider
    }

    public func makeFetchTrendingMoviesUseCase() -> some FetchTrendingMoviesUseCase {
        let repository = makeTrendingRepository()

        return DefaultFetchTrendingMoviesUseCase(repository: repository)
    }

    public func makeFetchTrendingTVSeriesUseCase() -> some FetchTrendingTVSeriesUseCase {
        let repository = makeTrendingRepository()

        return DefaultFetchTrendingTVSeriesUseCase(repository: repository)
    }

    public func makeFetchTrendingPeopleUseCase() -> some FetchTrendingPeopleUseCase {
        let repository = makeTrendingRepository()

        return DefaultFetchTrendingPeopleUseCase(repository: repository)
    }

}

extension TrendingContainer {

    private func makeTrendingRepository() -> TrendingRepository {
        TrendingInfrastructureContainer.makeTrendingRepository(
            trendingService: trendingService,
            appConfigurationProvider: appConfigurationProvider
        )
    }

}

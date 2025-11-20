//
//  TrendingRepositoriesFactory.swift
//  TrendingKit
//
//  Created by Adam Young on 28/05/2025.
//

import CoreInterfaces
import Foundation
import TMDb
import TrendingDomain

package final class TrendingInfrastructureContainer {

    private init() {}

    package static func makeTrendingRepository(
        trendingService: some TrendingService,
        appConfigurationProvider: some AppConfigurationProvider
    ) -> some TrendingRepository {
        let remoteDataSource = Self.makeTrendingRemoteDataSource(
            trendingService: trendingService,
            appConfigurationProvider: appConfigurationProvider
        )

        return DefaultTrendingRepository(remoteDataSource: remoteDataSource)
    }

}

extension TrendingInfrastructureContainer {

    private static func makeTrendingRemoteDataSource(
        trendingService: some TrendingService,
        appConfigurationProvider: some AppConfigurationProvider
    ) -> some TrendingRemoteDataSource {
        TMDbTrendingRemoteDataSource(
            trendingService: trendingService,
            appConfigurationProvider: appConfigurationProvider
        )
    }

}

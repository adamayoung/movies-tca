//
//  TrendingRepositoriesFactory.swift
//  TrendingKit
//
//  Created by Adam Young on 28/05/2025.
//

import Foundation
import TMDb
import TrendingDomain

package final class TrendingInfrastructureContainer {

    private init() {}

    package static func makeTrendingRepository(
        trendingService: some TrendingService
    ) -> some TrendingRepository {
        let remoteDataSource = Self.makeTrendingRemoteDataSource(trendingService: trendingService)

        return DefaultTrendingRepository(remoteDataSource: remoteDataSource)
    }

}

extension TrendingInfrastructureContainer {

    private static func makeTrendingRemoteDataSource(
        trendingService: some TrendingService
    ) -> some TrendingRemoteDataSource {
        TMDbTrendingRemoteDataSource(trendingService: trendingService)
    }

}

//
//  TVInfrastructureContainer.swift
//  TVKit
//
//  Created by Adam Young on 18/11/2025.
//

import Foundation
import TMDb
import TVDomain

package final class TVInfrastructureContainer {

    private init() {}

    package static func makeTVSeriesRepository(
        tvSeriesService: some TVSeriesService
    ) -> some TVSeriesRepository {
        let remoteDataSource = Self.makeTVSeriesRemoteDataSource(
            tvSeriesService: tvSeriesService
        )

        return DefaultTVSeriesRepository(remoteDataSource: remoteDataSource)
    }

}

extension TVInfrastructureContainer {

    private static func makeTVSeriesRemoteDataSource(
        tvSeriesService: some TVSeriesService
    ) -> some TVSeriesRemoteDataSource {
        TMDbTVSeriesRemoteDataSource(tvSeriesService: tvSeriesService)
    }

}

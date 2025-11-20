//
//  DefaultTVSeriesRepository.swift
//  TVKit
//
//  Created by Adam Young on 28/05/2025.
//

import Foundation
import TMDb
import TVDomain

final class DefaultTVSeriesRepository: TVSeriesRepository {

    private let remoteDataSource: any TVSeriesRemoteDataSource

    init(remoteDataSource: some TVSeriesRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func tvSeries(withID id: Int) async throws(TVSeriesRepositoryError) -> TVDomain.TVSeries {
        let tvSeries = try await remoteDataSource.tvSeries(withID: id)
        return tvSeries
    }

}

//
//  TMDbTVSeriesRemoteDataSource.swift
//  TVKit
//
//  Created by Adam Young on 18/11/2025.
//

import CoreDomain
import Foundation
import TMDb
import TVDomain

final class TMDbTVSeriesRemoteDataSource: TVSeriesRemoteDataSource {

    private let tvSeriesService: any TVSeriesService

    init(tvSeriesService: any TVSeriesService) {
        self.tvSeriesService = tvSeriesService
    }

    func tvSeries(withID id: Int) async throws(TVSeriesRepositoryError) -> TVDomain.TVSeries {
        let tmdbTVSeries: TMDb.TVSeries
        do {
            tmdbTVSeries = try await tvSeriesService.details(forTVSeries: id, language: "en")
        } catch let error {
            throw TVSeriesRepositoryError(error)
        }

        let mapper = TVSeriesMapper()
        let tvSeries = mapper.map(tmdbTVSeries)

        return tvSeries
    }

}

extension TVSeriesRepositoryError {

    fileprivate init(_ error: Error) {
        guard let error = error as? TMDbError else {
            self = .unknown(error)
            return
        }

        self.init(error)
    }

    fileprivate init(_ error: TMDbError) {
        switch error {
        case .notFound:
            self = .notFound
        case .unauthorised:
            self = .unauthorised
        default:
            self = .unknown(error)
        }
    }

}

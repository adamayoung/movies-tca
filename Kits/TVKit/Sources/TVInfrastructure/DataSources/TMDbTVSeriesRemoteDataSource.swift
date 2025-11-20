//
//  TMDbTVSeriesRemoteDataSource.swift
//  TVKit
//
//  Created by Adam Young on 18/11/2025.
//

import CoreDomain
import CoreInterfaces
import Foundation
import TMDb
import TVDomain

final class TMDbTVSeriesRemoteDataSource: TVSeriesRemoteDataSource {

    private let tvSeriesService: any TVSeriesService
    private let appConfigurationProvider: any AppConfigurationProvider

    init(
        tvSeriesService: any TVSeriesService,
        appConfigurationProvider: some AppConfigurationProvider
    ) {
        self.tvSeriesService = tvSeriesService
        self.appConfigurationProvider = appConfigurationProvider
    }

    func tvSeries(withID id: Int) async throws(TVSeriesRepositoryError) -> TVDomain.TVSeries {
        let tmdbTVSeries: TMDb.TVSeries
        do {
            tmdbTVSeries = try await tvSeriesService.details(forTVSeries: id, language: "en")
        } catch let error {
            throw TVSeriesRepositoryError(error)
        }

        let imagesConfiguration: CoreDomain.ImagesConfiguration
        do {
            imagesConfiguration = try await appConfigurationProvider.appConfiguration().images
        } catch let error {
            throw TVSeriesRepositoryError(error)
        }

        let mapper = TVSeriesMapper(imagesConfiguration: imagesConfiguration)
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

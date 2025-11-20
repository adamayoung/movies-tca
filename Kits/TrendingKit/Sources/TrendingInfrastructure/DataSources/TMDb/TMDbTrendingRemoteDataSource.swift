//
//  TMDbTrendingRemoteDataSource.swift
//  TrendingKit
//
//  Created by Adam Young on 29/05/2025.
//

import CoreDomain
import CoreInterfaces
import Foundation
import TMDb
import TrendingDomain

final class TMDbTrendingRemoteDataSource: TrendingRemoteDataSource {

    private let trendingService: any TrendingService
    private let appConfigurationProvider: any AppConfigurationProvider

    init(
        trendingService: some TrendingService,
        appConfigurationProvider: any AppConfigurationProvider
    ) {
        self.trendingService = trendingService
        self.appConfigurationProvider = appConfigurationProvider
    }

    func movies(page: Int) async throws(TrendingRepositoryError) -> [CoreDomain.MovieListItem] {
        let tmdbMovies: MoviePageableList
        do {
            tmdbMovies = try await trendingService.movies(
                inTimeWindow: .day,
                page: page,
                language: "en"
            )
        } catch let error {
            throw TrendingRepositoryError(error)
        }

        let imagesConfiguration: CoreDomain.ImagesConfiguration
        do {
            imagesConfiguration = try await appConfigurationProvider.appConfiguration().images
        } catch let error {
            throw TrendingRepositoryError(error)
        }

        let mapper = MovieListItemMapper(imagesConfiguration: imagesConfiguration)
        return tmdbMovies.results.map(mapper.map)
    }

    func tvSeries(
        page: Int
    ) async throws(TrendingRepositoryError) -> [CoreDomain.TVSeriesListItem] {
        let tmdbTVSeries: TVSeriesPageableList
        do {
            tmdbTVSeries = try await trendingService.tvSeries(
                inTimeWindow: .day,
                page: page,
                language: "en"
            )
        } catch let error {
            throw TrendingRepositoryError(error)
        }

        let imagesConfiguration: CoreDomain.ImagesConfiguration
        do {
            imagesConfiguration = try await appConfigurationProvider.appConfiguration().images
        } catch let error {
            throw TrendingRepositoryError(error)
        }

        let mapper = TVSeriesListItemMapper(imagesConfiguration: imagesConfiguration)
        return tmdbTVSeries.results.map(mapper.map)
    }

    func people(
        page: Int
    ) async throws(TrendingRepositoryError) -> [CoreDomain.PersonListItem] {
        let tmdbPeople: PersonPageableList
        do {
            tmdbPeople = try await trendingService.people(
                inTimeWindow: .day,
                page: page,
                language: "en"
            )
        } catch let error {
            throw TrendingRepositoryError(error)
        }

        let imagesConfiguration: CoreDomain.ImagesConfiguration
        do {
            imagesConfiguration = try await appConfigurationProvider.appConfiguration().images
        } catch let error {
            throw TrendingRepositoryError(error)
        }

        let mapper = PersonListItemMapper(imagesConfiguration: imagesConfiguration)
        return tmdbPeople.results.map(mapper.map)
    }

}

extension TrendingRepositoryError {

    fileprivate init(_ error: Error) {
        guard let error = error as? TMDbError else {
            self = .unknown(error)
            return
        }

        self.init(error)
    }

    fileprivate init(_ error: TMDbError) {
        switch error {
        case .unauthorised:
            self = .unauthorised
        default:
            self = .unknown(error)
        }
    }

}

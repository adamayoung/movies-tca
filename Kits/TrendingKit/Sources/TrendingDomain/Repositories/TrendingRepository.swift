//
//  TrendingRepository.swift
//  TrendingKit
//
//  Created by Adam Young on 28/05/2025.
//

import CoreDomain
import Foundation

public protocol TrendingRepository: Sendable {

    func movies(page: Int) async throws(TrendingRepositoryError) -> [MovieListItem]

    func tvSeries(page: Int) async throws(TrendingRepositoryError) -> [TVSeriesListItem]

    func people(page: Int) async throws(TrendingRepositoryError) -> [PersonListItem]

}

public enum TrendingRepositoryError: Error {

    case unauthorised
    case unknown(Error?)

}

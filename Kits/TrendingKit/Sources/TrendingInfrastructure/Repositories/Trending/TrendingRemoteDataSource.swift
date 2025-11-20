//
//  TrendingRemoteDataSource.swift
//  TrendingKit
//
//  Created by Adam Young on 29/05/2025.
//

import CoreDomain
import Foundation
import TrendingDomain

protocol TrendingRemoteDataSource: Sendable {

    func movies(page: Int) async throws(TrendingRepositoryError) -> [MovieListItem]

    func tvSeries(page: Int) async throws(TrendingRepositoryError) -> [TVSeriesListItem]

    func people(page: Int) async throws(TrendingRepositoryError) -> [PersonListItem]

}

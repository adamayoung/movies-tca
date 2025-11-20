//
//  FetchTrendingTVSeriesUseCase.swift
//  TrendingKit
//
//  Created by Adam Young on 09/06/2025.
//

import CoreDomain
import Foundation

public protocol FetchTrendingTVSeriesUseCase: Sendable {

    func execute() async throws(FetchTrendingTVSeriesError) -> [TVSeriesListItem]

    func execute(page: Int) async throws(FetchTrendingTVSeriesError) -> [TVSeriesListItem]

}

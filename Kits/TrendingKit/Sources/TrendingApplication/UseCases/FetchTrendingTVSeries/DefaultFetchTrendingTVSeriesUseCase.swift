//
//  DefaultFetchTrendingTVSeriesUseCase.swift
//  TrendingKit
//
//  Created by Adam Young on 09/06/2025.
//

import CoreDomain
import Foundation
import TrendingDomain

final class DefaultFetchTrendingTVSeriesUseCase: FetchTrendingTVSeriesUseCase {

    private let repository: any TrendingRepository

    init(repository: some TrendingRepository) {
        self.repository = repository
    }

    func execute() async throws(FetchTrendingTVSeriesError) -> [TVSeriesListItem] {
        try await execute(page: 1)
    }

    func execute(page: Int) async throws(FetchTrendingTVSeriesError) -> [TVSeriesListItem] {
        let tvSeries: [TVSeriesListItem]
        do {
            tvSeries = try await repository.tvSeries(page: page)
        } catch let error {
            throw FetchTrendingTVSeriesError(error)
        }

        return tvSeries
    }

}

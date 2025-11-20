//
//  DefaultFetchTVSeriesUseCase.swift
//  TVKit
//
//  Created by Adam Young on 03/06/2025.
//

import Foundation
import TVDomain

final class DefaultFetchTVSeriesUseCase: FetchTVSeriesUseCase {

    private let repository: any TVSeriesRepository

    init(repository: some TVSeriesRepository) {
        self.repository = repository
    }

    func execute(id: TVSeries.ID) async throws(FetchTVSeriesError) -> TVSeries {
        let tvSeries: TVSeries
        do {
            tvSeries = try await repository.tvSeries(withID: id)
        } catch let error {
            throw FetchTVSeriesError(error)
        }

        return tvSeries
    }

}

//
//  FetchTVSeriesUseCase.swift
//  TVKit
//
//  Created by Adam Young on 03/06/2025.
//

import Foundation
import TVDomain

public protocol FetchTVSeriesUseCase: Sendable {

    func execute(id: TVSeries.ID) async throws(FetchTVSeriesError) -> TVSeries

}

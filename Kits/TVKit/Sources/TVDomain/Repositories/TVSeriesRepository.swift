//
//  TVSeriesRepository.swift
//  TVKit
//
//  Created by Adam Young on 18/11/2025.
//

import Foundation

public protocol TVSeriesRepository: Sendable {

    func tvSeries(withID id: Int) async throws(TVSeriesRepositoryError) -> TVSeries

}

public enum TVSeriesRepositoryError: Error {

    case notFound
    case unauthorised
    case unknown(Error? = nil)

}

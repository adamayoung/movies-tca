//
//  FetchTrendingMoviesError.swift
//  TrendingKit
//
//  Created by Adam Young on 06/06/2025.
//

import Foundation
import TrendingDomain

public enum FetchTrendingMoviesError: Error {

    case unauthorised
    case unknown(Error?)

}

extension FetchTrendingMoviesError {

    init(_ error: TrendingRepositoryError) {
        switch error {
        case .unauthorised:
            self = .unauthorised
        case .unknown(let error):
            self = .unknown(error)
        }
    }

}

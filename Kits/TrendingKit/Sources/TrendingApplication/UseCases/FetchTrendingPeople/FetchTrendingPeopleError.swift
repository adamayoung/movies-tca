//
//  FetchTrendingPeopleError.swift
//  TrendingKit
//
//  Created by Adam Young on 09/06/2025.
//

import Foundation
import TrendingDomain

public enum FetchTrendingPeopleError: Error {

    case unauthorised
    case unknown(Error?)

}

extension FetchTrendingPeopleError {

    init(_ error: TrendingRepositoryError) {
        switch error {
        case .unauthorised:
            self = .unauthorised
        case .unknown(let error):
            self = .unknown(error)
        }
    }

}

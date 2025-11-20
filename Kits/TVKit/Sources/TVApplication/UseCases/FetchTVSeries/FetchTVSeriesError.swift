//
//  FetchTVSeriesError.swift
//  TVKit
//
//  Created by Adam Young on 09/06/2025.
//

import Foundation
import TVDomain

public enum FetchTVSeriesError: Error {

    case notFound
    case unauthorised
    case unknown(Error?)

}

extension FetchTVSeriesError {

    init(_ error: Error) {
        guard let tvSeriesRepositoryError = error as? TVSeriesRepositoryError else {
            self = .unknown(error)
            return
        }

        self.init(tvSeriesRepositoryError)
    }

    init(_ error: TVSeriesRepositoryError) {
        switch error {
        case .notFound:
            self = .notFound
        case .unauthorised:
            self = .unauthorised
        case .unknown(let error):
            self = .unknown(error)
        }
    }

}

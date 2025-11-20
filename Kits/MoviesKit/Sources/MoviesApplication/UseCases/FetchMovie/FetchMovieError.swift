//
//  FetchMovieError.swift
//  MoviesKit
//
//  Created by Adam Young on 09/06/2025.
//

import Foundation
import MoviesDomain

public enum FetchMovieError: Error {

    case notFound
    case unauthorised
    case unknown(Error?)

}

extension FetchMovieError {

    init(_ error: Error) {
        guard let movieRepositoryError = error as? MovieRepositoryError else {
            self = .unknown(error)
            return
        }

        self.init(movieRepositoryError)
    }

    init(_ error: MovieRepositoryError) {
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

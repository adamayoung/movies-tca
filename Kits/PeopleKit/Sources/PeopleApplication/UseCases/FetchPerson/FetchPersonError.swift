//
//  FetchPersonError.swift
//  PeopleKit
//
//  Created by Adam Young on 09/06/2025.
//

import Foundation
import PeopleDomain

public enum FetchPersonError: Error {

    case notFound
    case unauthorised
    case unknown(Error?)

}

extension FetchPersonError {

    init(_ error: Error) {
        guard let personRepositoryError = error as? PersonRepositoryError else {
            self = .unknown(error)
            return
        }

        self.init(personRepositoryError)
    }

    init(_ error: PersonRepositoryError) {
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

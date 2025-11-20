//
//  TMDbClient+TCA.swift
//  TMDbAdapters
//
//  Created by Adam Young on 18/11/2025.
//

import ComposableArchitecture
import Foundation
import TMDb

enum TMDbClientKey: DependencyKey {

    static let liveValue = TMDbClient(apiKey: "cf458964ba75aa9d53a21578df3747ed")

}

extension DependencyValues {

    var tmdb: TMDbClient {
        get { self[TMDbClientKey.self] }
        set { self[TMDbClientKey.self] = newValue }
    }

}

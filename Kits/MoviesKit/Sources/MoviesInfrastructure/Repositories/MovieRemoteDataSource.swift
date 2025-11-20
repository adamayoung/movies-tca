//
//  MovieRemoteDataSource.swift
//  MoviesKit
//
//  Created by Adam Young on 18/11/2025.
//

import Foundation
import MoviesDomain

protocol MovieRemoteDataSource: Sendable {

    func movie(withID id: Int) async throws(MovieRepositoryError) -> Movie

}

//
//  DefaultMovieRepository.swift
//  MoviesKit
//
//  Created by Adam Young on 28/05/2025.
//

import Foundation
import MoviesDomain
import TMDb

final class DefaultMovieRepository: MovieRepository {

    private let remoteDataSource: any MovieRemoteDataSource

    init(remoteDataSource: some MovieRemoteDataSource) {
        self.remoteDataSource = remoteDataSource
    }

    func movie(withID id: Int) async throws(MovieRepositoryError) -> MovieEntity {
        let movie = try await remoteDataSource.movie(withID: id)
        return movie
    }

}

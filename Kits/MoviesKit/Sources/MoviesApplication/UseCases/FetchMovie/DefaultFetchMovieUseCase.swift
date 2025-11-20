//
//  DefaultFetchMovieUseCase.swift
//  MoviesKit
//
//  Created by Adam Young on 03/06/2025.
//

import Foundation
import MoviesDomain

final class DefaultFetchMovieUseCase: FetchMovieUseCase {

    private let repository: any MovieRepository

    init(repository: some MovieRepository) {
        self.repository = repository
    }

    func execute(id: Movie.ID) async throws(FetchMovieError) -> Movie {
        let movie: Movie
        do {
            movie = try await repository.movie(withID: id)
        } catch let error {
            throw FetchMovieError(error)
        }

        return movie
    }

}

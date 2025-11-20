//
//  DefaultFetchTrendingMoviesUseCase.swift
//  TrendingKit
//
//  Created by Adam Young on 03/06/2025.
//

import CoreDomain
import Foundation
import TrendingDomain

final class DefaultFetchTrendingMoviesUseCase: FetchTrendingMoviesUseCase {

    private let repository: any TrendingRepository

    init(repository: some TrendingRepository) {
        self.repository = repository
    }

    func execute() async throws(FetchTrendingMoviesError) -> [MovieListItem] {
        try await execute(page: 1)
    }

    func execute(page: Int) async throws(FetchTrendingMoviesError) -> [MovieListItem] {
        let movies: [MovieListItem]
        do {
            movies = try await repository.movies(page: page)
        } catch let error {
            throw FetchTrendingMoviesError(error)
        }

        return movies
    }

}

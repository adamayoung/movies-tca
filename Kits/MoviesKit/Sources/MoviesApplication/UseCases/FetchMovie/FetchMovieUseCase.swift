//
//  FetchMovieUseCase.swift
//  MoviesKit
//
//  Created by Adam Young on 03/06/2025.
//

import Foundation

public protocol FetchMovieUseCase: Sendable {

    func execute(id: Movie.ID) async throws(FetchMovieError) -> Movie

}

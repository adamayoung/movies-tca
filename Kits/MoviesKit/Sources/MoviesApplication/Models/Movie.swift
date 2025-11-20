//
//  Movie.swift
//  MoviesKit
//
//  Created by Adam Young on 20/11/2025.
//

import Foundation

public struct Movie: Identifiable, Equatable, Sendable {

    public let id: Int
    public let title: String
    public let overview: String?
    public let posterURLSet: ImageURLSet?
    public let backdropURLSet: ImageURLSet?

    public init(
        id: Int,
        title: String,
        overview: String? = nil,
        posterURLSet: ImageURLSet? = nil,
        backdropURLSet: ImageURLSet? = nil
    ) {
        self.id = id
        self.title = title
        self.overview = overview
        self.posterURLSet = posterURLSet
        self.backdropURLSet = backdropURLSet
    }

}

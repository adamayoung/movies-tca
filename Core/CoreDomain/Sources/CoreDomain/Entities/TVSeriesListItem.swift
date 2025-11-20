//
//  TVSeriesListItem.swift
//  CoreDomain
//
//  Created by Adam Young on 10/06/2025.
//

import Foundation

public struct TVSeriesListItem: Identifiable, Equatable, Sendable {

    public let id: Int
    public let name: String
    public let overview: String
    public let posterURLSet: ImageURLSet?
    public let backdropURLSet: ImageURLSet?

    public init(
        id: Int,
        name: String,
        overview: String,
        posterURLSet: ImageURLSet? = nil,
        backdropURLSet: ImageURLSet? = nil
    ) {
        self.id = id
        self.name = name
        self.overview = overview
        self.posterURLSet = posterURLSet
        self.backdropURLSet = backdropURLSet
    }

}

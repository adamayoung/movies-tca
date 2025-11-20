//
//  TVSeries.swift
//  TVKit
//
//  Created by Adam Young on 28/05/2025.
//

import CoreDomain
import Foundation

public struct TVSeries: Identifiable, Equatable, Sendable {

    public let id: Int
    public let name: String
    public let overview: String?
    public let posterURLSet: ImageURLSet?
    public let backdropURLSet: ImageURLSet?

    public init(
        id: Int,
        name: String,
        overview: String? = nil,
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

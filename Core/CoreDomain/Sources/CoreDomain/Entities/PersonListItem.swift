//
//  PersonListItem.swift
//  CoreDomain
//
//  Created by Adam Young on 10/06/2025.
//

import Foundation

public struct PersonListItem: Identifiable, Equatable, Sendable {

    public let id: Int
    public let name: String
    public let knownForDepartment: String
    public let gender: Gender
    public let profileURLSet: ImageURLSet?

    public init(
        id: Int,
        name: String,
        knownForDepartment: String,
        gender: Gender,
        profileURLSet: ImageURLSet? = nil
    ) {
        self.id = id
        self.name = name
        self.knownForDepartment = knownForDepartment
        self.gender = gender
        self.profileURLSet = profileURLSet
    }

}

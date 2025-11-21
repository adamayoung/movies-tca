//
//  Person.swift
//  PeopleKit
//
//  Created by Adam Young on 28/05/2025.
//

import CoreDomain
import Foundation

public struct Person: Identifiable, Equatable, Sendable {

    public let id: Int
    public let name: String
    public let knownForDepartment: String
    public let gender: Gender
    public let profilePath: URL?

    public init(
        id: Int,
        name: String,
        knownForDepartment: String,
        gender: Gender,
        profilePath: URL? = nil
    ) {
        self.id = id
        self.name = name
        self.knownForDepartment = knownForDepartment
        self.gender = gender
        self.profilePath = profilePath
    }

}

//
//  FetchPersonUseCase.swift
//  PeopleKit
//
//  Created by Adam Young on 03/06/2025.
//

import Foundation
import PeopleDomain

public protocol FetchPersonUseCase: Sendable {

    func execute(id: Person.ID) async throws(FetchPersonError) -> Person

}

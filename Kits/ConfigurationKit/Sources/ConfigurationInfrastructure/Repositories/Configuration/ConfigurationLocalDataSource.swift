//
//  ConfigurationLocalDataSource.swift
//  ConfigurationKit
//
//  Created by Adam Young on 29/05/2025.
//

import ConfigurationDomain
import CoreDomain
import Foundation

protocol ConfigurationLocalDataSource: Actor, Sendable {

    func configuration() async -> AppConfiguration?

    func setConfiguration(_ configuration: AppConfiguration) async

}

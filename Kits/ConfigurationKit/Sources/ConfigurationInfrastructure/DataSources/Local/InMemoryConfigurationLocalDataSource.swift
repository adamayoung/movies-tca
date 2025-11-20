//
//  InMemoryConfigurationLocalDataSource.swift
//  ConfigurationKit
//
//  Created by Adam Young on 29/05/2025.
//

import ConfigurationDomain
import CoreDomain
import Foundation

actor InMemoryConfigurationLocalDataSource: ConfigurationLocalDataSource {

    static let shared = InMemoryConfigurationLocalDataSource()

    private var cachedConfiguration: AppConfiguration?

    private init() {}

    func configuration() async -> AppConfiguration? {
        self.cachedConfiguration
    }

    func setConfiguration(_ configuration: AppConfiguration) {
        self.cachedConfiguration = configuration
    }

}

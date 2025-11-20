//
//  Default.swift
//  ConfigurationKit
//
//  Created by Adam Young on 19/11/2025.
//

import ConfigurationDomain
import CoreDomain
import CoreInterfaces
import Foundation

final class DefaultAppConfigurationProvider: AppConfigurationProvider {

    private let repository: any ConfigurationRepository

    init(repository: some ConfigurationRepository) {
        self.repository = repository
    }

    func appConfiguration() async throws(AppConfigurationProviderError) -> AppConfiguration {
        let appConfiguration: AppConfiguration
        do {
            appConfiguration = try await repository.configuration()
        } catch let error {
            throw AppConfigurationProviderError(error)
        }

        return appConfiguration
    }

}

extension AppConfigurationProviderError {

    init(_ error: ConfigurationRepositoryError) {
        switch error {
        case .unauthorised:
            self = .unauthorised
        case .unknown(let error):
            self = .unknown(error)
        }
    }

}

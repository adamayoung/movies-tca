//
//  ConfigurationContainer.swift
//  MoviesKit
//
//  Created by Adam Young on 15/10/2025.
//

import ConfigurationDomain
import ConfigurationInfrastructure
import CoreInterfaces
import Foundation
import TMDb

public final class ConfigurationContainer {

    private let configurationService: any ConfigurationService

    public init(configurationService: some ConfigurationService) {
        self.configurationService = configurationService
    }

    public func makeFetchAppConfigurationUseCase() -> some FetchAppConfigurationUseCase {
        let repository = makeConfigurationRepository()

        return DefaultFetchAppConfigurationUseCase(repository: repository)
    }

    public func makeAppConfigurationProvider() -> some AppConfigurationProvider {
        let repository = makeConfigurationRepository()

        return DefaultAppConfigurationProvider(repository: repository)
    }

}

extension ConfigurationContainer {

    private func makeConfigurationRepository() -> ConfigurationRepository {
        ConfigurationInfrastructureContainer.makeConfigurationRepository(
            configurationService: configurationService
        )
    }

}

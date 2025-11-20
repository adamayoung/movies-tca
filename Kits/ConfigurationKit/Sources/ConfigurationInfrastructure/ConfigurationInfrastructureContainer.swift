//
//  ConfigurationInfrastructureContainer.swift
//  ConfigurationKit
//
//  Created by Adam Young on 29/05/2025.
//

import ConfigurationDomain
import Foundation
import TMDb

package final class ConfigurationInfrastructureContainer {

    private init() {}

    package static func makeConfigurationRepository(
        configurationService: some ConfigurationService
    ) -> some ConfigurationRepository {
        let remoteDataSource = Self.makeConfigurationRemoteDataSource(
            configurationService: configurationService
        )
        let localDataSource = Self.makeConfigurationLocalDataSource()

        return DefaultConfigurationRepository(
            remoteDataSource: remoteDataSource,
            localDataSource: localDataSource
        )
    }

}

extension ConfigurationInfrastructureContainer {

    private static func makeConfigurationRemoteDataSource(
        configurationService: some ConfigurationService
    ) -> some ConfigurationRemoteDataSource {
        TMDbConfigurationRemoteDataSource(configurationService: configurationService)
    }

    private static func makeConfigurationLocalDataSource() -> some ConfigurationLocalDataSource {
        InMemoryConfigurationLocalDataSource.shared
    }

}

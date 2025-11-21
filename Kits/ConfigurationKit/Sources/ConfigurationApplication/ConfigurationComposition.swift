//
//  ConfigurationComposition.swift
//  ConfigurationKit
//
//  Created by Adam Young on 20/11/2025.
//

import Foundation
import ConfigurationDomain
import ConfigurationInfrastructure
import TMDb

public struct ConfigurationComposition {

    private init() {}

    public static func makeConfigurationContainer(
        configurationService: some ConfigurationService
    ) -> ConfigurationContainer {
        let configurationRepository = ConfigurationInfrastructureContainer.makeConfigurationRepository(
            configurationService: configurationService
        )
        
        return ConfigurationContainer(configurationRepository: configurationRepository)
    }

}

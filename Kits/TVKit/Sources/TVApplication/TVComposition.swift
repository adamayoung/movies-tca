//
//  TVComposition.swift
//  TVKit
//
//  Created by Adam Young on 20/11/2025.
//

import Foundation
import TVDomain
import TVInfrastructure
import TMDb

public struct TVComposition {

    private init() {}

    public static func makeTVContainer(
        tvSeriesService: some TVSeriesService,
        appConfigurationProvider: some AppConfigurationProviding
    ) -> TVContainer {
        let tvSeriesRepository = TVInfrastructureContainer.makeTVSeriesRepository(tvSeriesService: tvSeriesService)
        
        return TVContainer(
            tvSeriesRepository: tvSeriesRepository,
            appConfigurationProvider: appConfigurationProvider
        )
    }

}

//
//  TrendingComposition.swift
//  TrendingKit
//
//  Created by Adam Young on 20/11/2025.
//

import Foundation
import TrendingDomain
import TrendingInfrastructure
import TMDb

public struct TrendingComposition {

    private init() {}

    public static func makeTrendingContainer(
        trendingService: some TrendingService,
        appConfigurationProvider: some AppConfigurationProviding,
        movieLogoImageProvider: some MovieLogoImageProviding,
        tvSeriesLogoImageProvider: some TVSeriesLogoImageProviding
    ) -> TrendingContainer {
        let trendingRepository = TrendingInfrastructureContainer.makeTrendingRepository(
            trendingService: trendingService
        )
        
        return TrendingContainer(
            trendingRepository: trendingRepository,
            appConfigurationProvider: appConfigurationProvider,
            movieLogoImageProvider: movieLogoImageProvider,
            tvSeriesLogoImageProvider: tvSeriesLogoImageProvider
        )
    }

}

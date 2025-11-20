//
//  TVContainer.swift
//  TVKit
//
//  Created by Adam Young on 15/10/2025.
//

import CoreInterfaces
import Foundation
import TMDb
import TVDomain
import TVInfrastructure

public final class TVContainer {

    private let tvSeriesService: any TVSeriesService
    private let appConfigurationProvider: any AppConfigurationProvider

    public init(
        tvSeriesService: some TVSeriesService,
        appConfigurationProvider: some AppConfigurationProvider
    ) {
        self.tvSeriesService = tvSeriesService
        self.appConfigurationProvider = appConfigurationProvider
    }

    public func makeFetchTVSeriesUseCase() -> some FetchTVSeriesUseCase {
        let repository = makeTVSeriesRepository()

        return DefaultFetchTVSeriesUseCase(repository: repository)
    }

}

extension TVContainer {

    private func makeTVSeriesRepository() -> TVSeriesRepository {
        TVInfrastructureContainer.makeTVSeriesRepository(
            tvSeriesService: tvSeriesService,
            appConfigurationProvider: appConfigurationProvider
        )
    }

}

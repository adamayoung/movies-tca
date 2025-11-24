//
//  TVSeriesLogoImageProviderAdapter.swift
//  TrendingAdapters
//
//  Created by Adam Young on 24/11/2025.
//

import CoreDomain
import TVApplication
import TrendingDomain

final class TVSeriesLogoImageProviderAdapter: TVSeriesLogoImageProviding {
    
    private let fetchImageCollectionUseCase: any FetchTVSeriesImageCollectionUseCase
    
    init(fetchImageCollectionUseCase: some FetchTVSeriesImageCollectionUseCase) {
        self.fetchImageCollectionUseCase = fetchImageCollectionUseCase
    }
    
    func imageURLSet(forTVSeries tvSeriesID: Int) async throws(TVSeriesLogoImageProviderError) -> ImageURLSet? {
        let imageCollectionDetails: ImageCollectionDetails
        do {
            imageCollectionDetails = try await fetchImageCollectionUseCase.execute(tvSeriesID: tvSeriesID)
        } catch let error {
            throw TVSeriesLogoImageProviderError(error)
        }
        
        return imageCollectionDetails.logoURLSets.first
    }
    
}

extension TVSeriesLogoImageProviderError {

    fileprivate init(_ error: Error) {
        guard let error = error as? FetchTVSeriesImageCollectionError else {
            self = .unknown(error)
            return
        }

        switch error {
        case .notFound:
            self = .notFound
        case .unauthorised:
            self = .unauthorised
        default:
            self = .unknown(error)
        }
    }

}

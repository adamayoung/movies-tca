//
//  AppConfigurationProvider.swift
//  CoreInterfaces
//
//  Created by Adam Young on 10/06/2025.
//

import CoreDomain
import Foundation

public protocol AppConfigurationProvider: Sendable {

    func appConfiguration() async throws(AppConfigurationProviderError) -> AppConfiguration

}

public enum AppConfigurationProviderError: Error {

    case unauthorised
    case unknown(Error? = nil)

}

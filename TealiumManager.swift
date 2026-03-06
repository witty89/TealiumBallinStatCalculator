//
//  TealiumManager.swift
//  TealiumBallinStatCalculator
//
//  Created by Alex on 3/6/26.
//

import Foundation
import TealiumCore
import TealiumLifecycle

class TealiumManager {

    static let shared = TealiumManager()

    let tealium: Tealium

    private init() {

        let config = TealiumConfig(
            account: "YOUR_ACCOUNT",
            profile: "YOUR_PROFILE",
            environment: "dev"
        )

        config.collectors = [
            Collectors.AppData,
            Collectors.Device,
            Collectors.Connectivity,
            Collectors.Lifecycle
        ]

        tealium = Tealium(config: config)
    }
}

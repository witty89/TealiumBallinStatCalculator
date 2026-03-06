//
//  AnalyticsService.swift
//  TealiumBallinStatCalculator
//
//  Created by Alex on 3/6/26.
//

import Foundation
import TealiumCore
import TealiumAutotracking

final class AnalyticsService {
    
    static let shared = AnalyticsService()
    
    private init() {}
    
    func trackView(name: String) {

        let dispatch = TealiumView(
            name,
            dataLayer: [
                AnalyticsParam.screenName: name
            ]
        )

        TealiumManager.shared.tealium.track(dispatch)
    }
    
    func trackEvent(name: String) {
        
        let dispatch = TealiumEvent(
            name,
            dataLayer: [
            AnalyticsParam.event: name
            ]
        )
        
        TealiumManager.shared.tealium.track(dispatch)
    }
}

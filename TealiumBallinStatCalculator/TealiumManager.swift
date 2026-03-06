//
//  TealiumManager.swift
//  TealiumBallinStatCalculator
//
//  Created by Alex on 3/5/26.
//

import TealiumCore
import TealiumAutotracking

final class TealiumHelper {
    static let shared = TealiumHelper()
    
    var tealium: Tealium?
    
    private init() {
        initialize()
    }
    
    func initialize() {
        let configuration = TealiumConfig(account: "", profile: "", environment: "")
//        configuration.collectors?.append(.app)
    }
    
    func trackView(viewName: String) {
        let screenView = TealiumView(
            "purchase",
            dataLayer: [
                "customer_id": "abc123",
                "order_total": 10.00,
                "product_id": ["PROD123", "PROD456"],
                "order_id": "0123456789"
            ]
        )
        tealium?.track(screenView)
    }
    
    func trackEvent(eventName: String) {
        let tealEvent = TealiumEvent(
            "eventName",
            dataLayer: [
                "customer_id": "abc123",
                "product_id": ["PROD123", "PROD456"],
                "product_price": [4.00, 6.00]
            ]
        )
        tealium?.track(tealEvent)
    }

}

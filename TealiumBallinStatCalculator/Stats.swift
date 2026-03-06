//
//  Stats.swift
//  TealiumBallinStatCalculator
//
//  Created by Alex on 3/4/26.
//

import Foundation
struct ShootingStats {
    var fgm: Int
    var threeFGM: Int
    var fga: Int
    var fta: Int
    
    var fgPercentage: Double {
        guard fga > 0 else { return 0 }
        return Double(fgm) / Double(fga)
    }
    
    var efgPercentage: Double {
        guard fga > 0 else { return 0 }
        return (Double(fgm) + 0.5 * Double(threeFGM)) / Double(fga)
    }
    
    var trueShootingPercentage: Double {
        let points = 3 * Double(threeFGM) + 2 * Double(fgm - threeFGM)
        let denominator = 2 * (Double(fga) + 0.44 * Double(fta))
        guard denominator > 0 else { return 0 }
        return points / denominator
    }
}

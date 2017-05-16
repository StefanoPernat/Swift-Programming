//
//  Accountant.swift
//  CyclicalAssets
//
//  Created by Stefano Pernat on 16/05/17.
//  Copyright © 2017 Stefano Pernat. All rights reserved.
//

import Foundation

class Accountant {
    typealias NetWorthChanged = (Double) -> Void
    
    var netWorthChangedHandler: NetWorthChanged? = nil
    var netWorth: Double = 0.0 {
        didSet {
            netWorthChangedHandler?(netWorth)
        }
    }
    
    func gained(_ asset: Asset, completition: () -> Void) {
        netWorth += asset.value
        completition()
    }
}

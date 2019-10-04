//
//  Asset.swift
//  Net Worth Tracker
//
//  Created by Nick Burinok on 2019-10-03.
//  Copyright © 2019 Mykola Burynok. All rights reserved.
//

import Foundation

struct Asset {
    var cashAndInvestments: [Account]
    var longTermAssets: [Account]
    var totalAssets: Double
}

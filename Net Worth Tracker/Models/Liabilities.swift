//
//  Liability.swift
//  Net Worth Tracker
//
//  Created by Nick Burinok on 2019-10-03.
//  Copyright © 2019 Mykola Burynok. All rights reserved.
//

import Foundation

struct Liabilities: Codable {
    var shortTerm: [Account]
    var longTermDebt: [Account]
    var totalLiabilities: Double
}

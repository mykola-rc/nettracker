//
//  Account.swift
//  Net Worth Tracker
//
//  Created by Nick Burinok on 2019-10-03.
//  Copyright © 2019 Mykola Burynok. All rights reserved.
//

import Foundation

enum AccountType: String, Codable {
    case chequing
}

struct Account: Codable {
    var type: String
    var value: Double
}

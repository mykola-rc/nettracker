//
//  Account.swift
//  Net Worth Tracker
//
//  Created by Nick Burinok on 2019-10-03.
//  Copyright © 2019 Mykola Burynok. All rights reserved.
//

import Foundation

enum AccountType: String {
    case chequing
}

struct Account {
    var type: String
    var value: Double
}

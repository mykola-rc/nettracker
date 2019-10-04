//
//  Double+Extensions.swift
//  Net Worth Tracker
//
//  Created by Nick Burinok on 2019-10-03.
//  Copyright © 2019 Mykola Burynok. All rights reserved.
//

import Foundation

extension Double {
    func toString() -> String {
        return String(format: "%.1f",self)
    }
}

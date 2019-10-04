//
//  AccountCellViewModel.swift
//  Net Worth Tracker
//
//  Created by Nick Burinok on 2019-10-03.
//  Copyright © 2019 Mykola Burynok. All rights reserved.
//

import Foundation

class AccountValueCellViewModel: RowViewModel {
    
    let title: String
    let textFieldValue: String
    
    init(title: String, value: Double) {
        self.title = title
        self.textFieldValue = value.toString()
    }
}

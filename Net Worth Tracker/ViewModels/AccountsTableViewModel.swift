//
//  AssetsTableViewModel.swift
//  Net Worth Tracker
//
//  Created by Nick Burinok on 2019-10-03.
//  Copyright © 2019 Mykola Burynok. All rights reserved.
//

import Foundation

enum AccountsTableViewModelType {
    case assets
    case liabilities
}

class AccountsTableViewModel {
    
    let type: AccountsTableViewModelType
    let sectionViewModels = Observable<[SectionViewModel]>(value: [])
    
    init(type: AccountsTableViewModelType) {
        self.type = type
    }
}

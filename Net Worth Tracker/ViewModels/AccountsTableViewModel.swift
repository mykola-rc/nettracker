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
    
    let headerTitle: String
    let footerTitle: String
    let type: AccountsTableViewModelType
    let sectionViewModels = Observable<[SectionViewModel]>(value: [])
    
    init(type: AccountsTableViewModelType, headerTitle: String, footerTitle: String) {
        self.type = type
        self.headerTitle = headerTitle
        self.footerTitle = footerTitle
    }
}

//
//  UserAccountController.swift
//  Net Worth Tracker
//
//  Created by Nick Burinok on 2019-10-03.
//  Copyright © 2019 Mykola Burynok. All rights reserved.
//

import Foundation

class UserAccountsController {
    
    let viewModel: AssetsTableViewModel
    
    // TODO: need to be raplaced with View Models
    private let accountSamples = [["Chequing", "2000.00"], ["Savings for Taxes", "4000.00"], ["Rainy Day Fund", "506.00"], ["Savings for Fun", "5000.00"], ["Savings for Travel", "400.0"], ["Savings for Personal Development", "200.0"], ["Investment 1", "5000.00"], ["Investment 2", "60,000.00"], ["Investment 3", "30,000.00"], ["Investment 4", "50,000.00"], ["Investment 5", "24,000.00"]]
    
    init(viewModel: AssetsTableViewModel = AssetsTableViewModel()) {
        self.viewModel = viewModel
    }
    
    func start() {
        
        var accounts = [Account]()
        
        for sample in accountSamples {
            let account = Account(type: sample[0], value: sample[1])
            accounts.append(account)
        }
        
        buildViewModels(accounts: accounts)
    }
    
    func buildViewModels(accounts: [Account]) {
        
        var sectionTable = [String: [RowViewModel]]()
        var vm: RowViewModel?
        
        for account in accounts {
            if 1 == 1 {
                
                vm = AccountValueCellViewModel(title: account.type, value: 1000.0)
            }
            
            if let vm = vm {
                if var rows = sectionTable["groupingKey"] {
                    rows.append(vm)
                    sectionTable["groupingKey"] = rows
                } else {
                    sectionTable["groupingKey"] = [vm]
                }
            }
        }
        
        
        let sectionViewModel = SectionViewModel(rowViewModels: sectionTable["groupingKey"]!, headerTitle: "groupingKey")
        self.viewModel.sectionViewModels.value = [sectionViewModel]
    }
    
    func cellIdentifier(for viewModel: RowViewModel) -> String {
        switch viewModel {
        case is AccountValueCellViewModel:
            return AccountValueCell.cellIdentifier()
        default:
            fatalError("Unexpected view model type: \(viewModel)")
        }
    }
}

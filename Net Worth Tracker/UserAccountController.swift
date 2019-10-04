//
//  UserAccountController.swift
//  Net Worth Tracker
//
//  Created by Nick Burinok on 2019-10-03.
//  Copyright © 2019 Mykola Burynok. All rights reserved.
//

import Foundation

class UserAccountsController {
    
    var viewModel: UserAccountsViewModel
    
    // TODO: need to be raplaced with View Models
    private let accountSamples = [["Chequing", 2000.00], ["Savings for Taxes", 4000.00], ["Rainy Day Fund", 506.00], ["Savings for Fun", 5_000.00], ["Savings for Travel", 400.0], ["Savings for Personal Development", 200.0], ["Investment 1", 5_000.00], ["Investment 2", 60_000.00], ["Investment 3", 30_000.00], ["Investment 4", 50_000.00], ["Investment 5", 24_000.00]]
    
    init(viewModel: UserAccountsViewModel = UserAccountsViewModel()) {
        self.viewModel = viewModel
    }
    
    public func start() {
        
        let userAccounts = getSampleUserAccounts()
        
        buildUserAccountsViewModel(userAccounts: userAccounts)
    }
    
    private func getSampleUserAccounts() -> UserAccounts {
        
        // create asset accounts by category
        var cashAndInvestmentAccounts = [Account]()
        for sample in accountSamples {
            let account = Account(type: sample[0] as! String, value: sample[1] as! Double)
            cashAndInvestmentAccounts.append(account)
        }
        
        let longTermAssetAccounts = [
            Account(type: "Primary Home", value: 455_000.00),
            Account(type: "Second Home", value: 1_564_321.00),
            Account(type: "Other", value: 0)
        ]
        
        let assets = Assets(cashAndInvestments: cashAndInvestmentAccounts,
                            longTermAssets: longTermAssetAccounts,
                            totalAssets: 2200427.00)
        
        // create liablity accounts by category
        let shortTermLiabilities = [
            Account(type: "Credit Card 1", value: 4342.00),
            Account(type: "Credit Card 2", value: 322.00),
            Account(type: "(others)", value: 0)
        ]
        
        let longTermDebtLiabilities = [
            Account(type: "Mortgage 1", value: 4_342.00),
            Account(type: "Mortgage 2", value: 322.00),
            Account(type: "Line of Credit", value: 0),
            Account(type: "Investment Loan", value: 4_342.00),
            Account(type: "Student Loan", value: 322.00),
            Account(type: "Car Loan", value: 0)
        ]
        
        let liabilities = Liabilities(shortTerm: shortTermLiabilities,
                                      longTermDebt: longTermDebtLiabilities,
                                      totalLiabilities: 908_287.00)
        
        return UserAccounts(assets: assets, liabilities: liabilities)
    }
    
    private func buildUserAccountsViewModel(userAccounts: UserAccounts) {
        
        let cashAndInvestments = sectionViewModelsFor(userAccounts.assets.cashAndInvestments, title: "Cash and Investments")
        let longTermAssets = sectionViewModelsFor(userAccounts.assets.longTermAssets, title: "Long Term Assets")
        let assetsViewModel = AssetsTableViewModel()
        assetsViewModel.sectionViewModels.value = [cashAndInvestments, longTermAssets]
        
        let shortTerm = sectionViewModelsFor(userAccounts.liabilities.shortTerm, title: "Short Term Liabilities")
        let longTermDebt = sectionViewModelsFor(userAccounts.liabilities.longTermDebt, title: "Long Term Debt")
        let liabilitiesViewModel = AssetsTableViewModel()
        liabilitiesViewModel.sectionViewModels.value = [shortTerm, longTermDebt]
        
        self.viewModel.assetsViewModel = assetsViewModel
        self.viewModel.liabilitiesViewModel = liabilitiesViewModel
    }
    
    private func sectionViewModelsFor(_ accounts: [Account], title: String) -> SectionViewModel {
        
        let rowModels = accounts.map { AccountValueCellViewModel(title: $0.type, value: $0.value) }
        return SectionViewModel(rowViewModels: rowModels, headerTitle: title)
    }
    
    public func cellIdentifier(for viewModel: RowViewModel) -> String {
        switch viewModel {
        case is AccountValueCellViewModel:
            return AccountValueCell.cellIdentifier()
        default:
            fatalError("Unexpected view model type: \(viewModel)")
        }
    }
}

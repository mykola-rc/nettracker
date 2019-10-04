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
    let apiService: Service
    
    init(viewModel: UserAccountsViewModel = UserAccountsViewModel(), apiService: Service = DataProvider()) {
        self.viewModel = viewModel
        self.apiService = apiService
    }
    
    public func start() {
        
        apiService.fetchUserAccounts { accounts in
            self.buildUserAccountsViewModel(userAccounts: accounts)
        }
    }
    
    private func buildUserAccountsViewModel(userAccounts: UserAccounts) {
        
        let cashAndInvestments = sectionViewModelsFor(userAccounts.assets.cashAndInvestments, title: "Cash and Investments")
        let longTermAssets = sectionViewModelsFor(userAccounts.assets.longTermAssets, title: "Long Term Assets")
        let assetsTableViewModel = AccountsTableViewModel(type: .assets, headerTitle: "Assets", footerTitle: "Total Assets")
        assetsTableViewModel.sectionViewModels.value = [cashAndInvestments, longTermAssets]
        
        let shortTerm = sectionViewModelsFor(userAccounts.liabilities.shortTerm, title: "Short Term Liabilities")
        let longTermDebt = sectionViewModelsFor(userAccounts.liabilities.longTermDebt, title: "Long Term Debt")
        let liabilitiesTableViewModel = AccountsTableViewModel(type: .liabilities, headerTitle: "Liabilities", footerTitle: "Total Liabilities")
        liabilitiesTableViewModel.sectionViewModels.value = [shortTerm, longTermDebt]
        
        self.viewModel.tableViewModels.value = [assetsTableViewModel, liabilitiesTableViewModel]
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

//
//  DataProvider.swift
//  Net Worth Tracker
//
//  Created by Nick Burinok on 2019-10-04.
//  Copyright © 2019 Mykola Burynok. All rights reserved.
//

import Foundation

protocol Service {
    func fetchUserAccounts(complete: @escaping (UserAccounts) -> Void)
}

class DataProvider: Service {
    
    /// Fetch feeds from server
    public func fetchUserAccounts(complete: @escaping (UserAccounts) -> Void) {
        DispatchQueue.global().async {
            sleep(3) // fake response time
            DispatchQueue.main.async {
                let userAccounts = UserAccountsFactory.shared().getSampleUserAccounts()
                Storage.store(userAccounts, to: .documents, as: "userAccounts.json")
                complete(userAccounts)
            }
        }
    }
    
    public func fetchUserAccountsFromLocalFile(complete: @escaping (UserAccounts) -> Void) {
        DispatchQueue.global().async {
            sleep(3) // fake response time
            DispatchQueue.main.async {
                let userAccounts = Storage.retrieve("userAccounts.json", from: .documents, as: UserAccounts.self)
                complete(userAccounts)
            }
        }
    }
}

class MockDataProvider: Service {
    
    /// Fetch feeds from server
    public func fetchUserAccounts(complete: @escaping (UserAccounts) -> Void) {
        
        let userAccounts = UserAccountsFactory.shared().getSampleUserAccounts()
        complete(userAccounts)
    }
}

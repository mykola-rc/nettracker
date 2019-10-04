//
//  ViewController.swift
//  Net Worth Tracker
//
//  Created by Mykola Burynok on 2019-10-01.
//  Copyright © 2019 Mykola Burynok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    fileprivate let tableView: UITableView = {
        let tbl = UITableView()
        tbl.tableFooterView = UIView()
        tbl.estimatedRowHeight(50)
        tbl.registerClass(FormTableViewCell.self)
        tbl.translatesAutoresizingMaskIntoConstraints = false
        return tbl
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.backgroundColor = .white
        tableView.dataSource = self
//        tableView.delegate = self
        view.addSubview(tableView)
        
        let guide = self.view.safeAreaLayoutGuide
        tableView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClassIdentifier: FormTableViewCell.self)
        cell.outerRow = indexPath.section
        cell.layoutSubviews()
        return cell
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item % 2 == 0 {
            let cellTitle = ""
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountNameCell.reuseIdentifier, for: indexPath) as! AccountNameCell
            cell.configure(cellTitle)
            return cell
        } else {
            let accountAmount = "" // accountNames[indexPath.item]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountAmountCell.reuseIdentifier, for: indexPath) as! AccountAmountCell
            cell.configure(accountAmount)
            return cell
        }
    }
}

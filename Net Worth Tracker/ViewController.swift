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
        let headerView = MainHeaderView(frame: CGRect(x: 0.0, y: 0.0, width: 414, height: 44.0))
        headerView.setTitle("Net Worth")
        tbl.tableHeaderView = headerView
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
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withClassIdentifier: FormTableViewCell.self)
        cell.outerRow = indexPath.section
        cell.tableType = indexPath.row == 0 ? .assets : .liabilities
        cell.layoutSubviews()
        return cell
    }
}

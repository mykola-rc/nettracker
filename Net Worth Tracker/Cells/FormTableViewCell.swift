//
//  FormTableViewCell.swift
//  Net Worth Tracker
//
//  Created by Nick Burinok on 2019-10-02.
//  Copyright © 2019 Mykola Burynok. All rights reserved.
//

import UIKit

class FormTableViewCell: UITableViewCell {
    
    // TODO: need to be raplaced with View Models
    private let accountNames = [["Chequing", "2000.00"], ["Savings for Taxes", "4000.00"], ["Rainy Day Fund", "506.00"], ["Savings for Fun", "5000.00"], ["Savings for Travel", "400.0"], ["Savings for Personal Development", "200.0"], ["Investment 1", "5000.00"], ["Investment 2", "60,000.00"], ["Investment 3", "30,000.00"], ["Investment 4", "50,000.00"], ["Investment 5", "24,000.00"]]
    
    fileprivate let formTableView: FormTableView = {
        let tbl = FormTableView()
        tbl.estimatedRowHeight(50)
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.registerClass(AccountValueCell.self)
        tbl.registerClass(UITableViewCell.self)
        // set an initial value to calculate a dynamic height
        tbl.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        return tbl
    }()
    
    var outerRow: Int = 0 {
        didSet {
            formTableView.reloadData()
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
//        formTableView.delegate = self
        formTableView.dataSource = self
        contentView.addSubview(formTableView)
        
        formTableView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        formTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        formTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        formTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        formTableView.layoutSubviews()
        superTableView?.beginUpdates()
        superTableView?.endUpdates()
    }
}

extension FormTableViewCell: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return accountNames.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row % 2 == 0 {
            let cell = tableView.dequeueReusableCell(withClassIdentifier: AccountValueCell.self)
            let accountValues = accountNames[indexPath.row]
            cell.configure(accountValues)
            return cell
        } else {
            let spaceCell = tableView.dequeueReusableCell(withClassIdentifier: UITableViewCell.self)
            return spaceCell
        }
    }
}

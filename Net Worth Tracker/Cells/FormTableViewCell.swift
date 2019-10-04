//
//  FormTableViewCell.swift
//  Net Worth Tracker
//
//  Created by Nick Burinok on 2019-10-02.
//  Copyright © 2019 Mykola Burynok. All rights reserved.
//

import UIKit

enum TableType {
    case assets
    case liabilities
}

class FormTableViewCell: UITableViewCell {
    
    var viewModel: AccountsTableViewModel? {
        didSet {
            if let headerTitle = viewModel?.headerTitle {
                
                headerView = TableHeaderView(frame: CGRect(x: 0.0, y: 0.0, width: 414, height: 44.0))
                headerView?.setTitle(headerTitle)
                formTableView.tableHeaderView = headerView
            }
            if let footerTitle = viewModel?.footerTitle {
                
                footerView = TableFooterView(frame: CGRect(x: 0.0, y: 0.0, width: 414, height: 44.0))
                footerView?.setTitle(footerTitle)
                formTableView.tableFooterView = footerView
            }
            formTableView.reloadData()
        }
    }
    
    lazy var controller: UserAccountsController = {
        return UserAccountsController()
    }()
    
    var headerView: TableHeaderView?
    var footerView: TableFooterView?
    
    fileprivate let formTableView: FormTableView = {
        let tbl = FormTableView()
        tbl.estimatedRowHeight(50)
        tbl.estimatedSectionHeaderHeight(50)
        tbl.translatesAutoresizingMaskIntoConstraints = false
        tbl.separatorStyle = .none
        tbl.registerClass(AccountValueCell.self)
        // set an initial value to calculate a dynamic height
        tbl.heightAnchor.constraint(equalToConstant: 50.0).isActive = true
        return tbl
    }()
    
    var outerRow: Int = 0 {
        didSet {
            formTableView.reloadData()
        }
    }
    
    var tableType: TableType = .assets
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        formTableView.delegate = self
        formTableView.dataSource = self
        contentView.addSubview(formTableView)
        
        formTableView.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        formTableView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        formTableView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor).isActive = true
        formTableView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        
        initBinding()
//        controller.start()
    }
    
    private func initBinding() {
        
        viewModel?.sectionViewModels.addObserver(fireNow: false) { [weak self] (sectionViewModels) in
            self?.formTableView.reloadData()
        }
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
        // Recalculates height
        superTableView?.beginUpdates()
        superTableView?.endUpdates()
    }
}

extension FormTableViewCell: UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.sectionViewModels.value.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let sectionViewModel = viewModel?.sectionViewModels.value[section]
        return sectionViewModel?.rowViewModels.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let sectionViewModel = viewModel?.sectionViewModels.value[indexPath.section] else {
            return UITableViewCell()
        }
        
        let rowViewModel = sectionViewModel.rowViewModels[indexPath.row]

        let cell = tableView.dequeueReusableCell(withIdentifier: controller.cellIdentifier(for: rowViewModel), for: indexPath)

        if let cell = cell as? CellConfigurable {
            cell.configure(viewModel: rowViewModel)
        }

        cell.layoutIfNeeded()
        return cell
    }
}

extension FormTableViewCell: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let sectionViewModel = viewModel?.sectionViewModels.value[indexPath.section] else {
            return
        }
        if let rowViewModel = sectionViewModel.rowViewModels[indexPath.row] as? ViewModelPressible {
            rowViewModel.cellPressed?()
        }
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard let sectionViewModel = viewModel?.sectionViewModels.value[section] else {
            return nil
        }
        
        let view = SectionHeaderView()
        view.setTitle(sectionViewModel.headerTitle)
        return view
    }
}

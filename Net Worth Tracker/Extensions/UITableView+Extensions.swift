//
//  UITableView+Extensions.swift
//  Net Worth Tracker
//
//  Created by Nick Burinok on 2019-10-02.
//  Copyright © 2019 Mykola Burynok. All rights reserved.
//

import UIKit

extension UITableView {
    
    public func estimatedRowHeight(_ height: CGFloat) {
        self.rowHeight = UITableView.automaticDimension
        self.estimatedRowHeight = height
    }
    
    func dequeueReusableCell<T : UITableViewCell>(withClassIdentifier cell: T.Type) -> T {
        if let Cell = dequeueReusableCell(withIdentifier: String(describing: cell.self)) as? T {
            return Cell
        }
        fatalError(String(describing: cell.self))
    }
    
    func registerNib(_ cellClass: UITableViewCell.Type) {
        let id = String(describing: cellClass.self)
        let nib = UINib(nibName: id, bundle: nil)
        register(nib, forCellReuseIdentifier: id)
    }
    
    func registerClass(_ cellClass: UITableViewCell.Type) {
        let id = String(describing: cellClass.self)
        register(cellClass.self, forCellReuseIdentifier: id)
    }
}

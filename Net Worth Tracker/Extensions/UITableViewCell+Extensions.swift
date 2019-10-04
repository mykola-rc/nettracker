//
//  UITableViewCell+Extension.swift
//  Net Worth Tracker
//
//  Created by Nick Burinok on 2019-10-01.
//  Copyright © 2019 Mykola Burynok. All rights reserved.
//

import UIKit


extension UITableViewCell {

    var superTableView: UITableView? {

        var view = superview

        while view != nil && !(view is UITableView) {
            view = view?.superview
        }

        return view as? UITableView
    }
    
    /// Generated cell identifier derived from class name
    public static func cellIdentifier() -> String {
        return String(describing: self)
    }
}

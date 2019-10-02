//
//  FormTableView.swift
//  Net Worth Tracker
//
//  Created by Nick Burinok on 2019-10-02.
//  Copyright © 2019 Mykola Burynok. All rights reserved.
//

import UIKit

class FormTableView: UITableView {

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        defaultInit()
    }
    
    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        defaultInit()
    }
    
    func defaultInit(){
        self.keyboardDismissMode = .onDrag
        self.showsVerticalScrollIndicator = false
        self.showsHorizontalScrollIndicator = false
        self.tableFooterView = UIView(frame: .zero)
        self.tableHeaderView = UIView(frame: .zero)
        self.sectionFooterHeight = 0
        self.sectionHeaderHeight = 0
    }
    
    override open func layoutSubviews() {
        super.layoutSubviews()
        
        if self.nsHeightConstraint != nil {
            self.nsHeightConstraint?.constant = self.contentSize.height
        }
        else{
            fatalError("Set a nsHeightConstraint to set contentSize with same")
        }
    }
}

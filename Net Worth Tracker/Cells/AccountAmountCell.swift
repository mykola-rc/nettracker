//
//  AccountAmountCell.swift
//  Net Worth Tracker
//
//  Created by Mykola Burynok on 2019-10-01.
//  Copyright © 2019 Mykola Burynok. All rights reserved.
//

import UIKit

class AccountAmountCell: UICollectionViewCell {
    
    static let reuseIdentifier = "AccountAmountCell"
    
    let viewBorder = CAShapeLayer()
    
    fileprivate let amountTextField: UITextField = {
        let txf = UITextField()
        txf.translatesAutoresizingMaskIntoConstraints = false
        return txf
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        amountTextField.placeholder = "placeholder text"
        amountTextField.textAlignment = .right
        amountTextField.textColor = .red
        contentView.addSubview(amountTextField)
        amountTextField.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        amountTextField.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        amountTextField.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 8.0).isActive = true
        amountTextField.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -8.0).isActive = true
        
        contentView.layer.addSublayer(viewBorder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        viewBorder.strokeColor = UIColor.black.cgColor
        viewBorder.lineDashPattern = [1, 2]
        viewBorder.frame = contentView.bounds
        viewBorder.fillColor = nil
        viewBorder.path = UIBezierPath(rect: contentView.bounds).cgPath
    }
    
    func configure(_ amount: String) {
        amountTextField.text = amount
    }
}

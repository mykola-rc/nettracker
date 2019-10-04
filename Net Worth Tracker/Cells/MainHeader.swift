//
//  MainHeader.swift
//  Net Worth Tracker
//
//  Created by Mykola Burynok on 2019-10-04.
//  Copyright © 2019 Mykola Burynok. All rights reserved.
//

import UIKit

public class MainHeaderView: UIView {
    
    private lazy var currencyTitleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)

        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textColor = UIColor.gray
        return label
    }()
    
    private lazy var currencyTypeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)

        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textColor = UIColor.red
        return label
    }()
    
    private lazy var topSeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)

        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textColor = UIColor.darkGreen
        return label
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(label)

        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textColor = UIColor.darkGreen
        label.textAlignment = .right
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupInitialView()
        setupConstrint()
    }

    public required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupInitialView()
        setupConstrint()
    }

    public func setTitle(_ text: String) {
        self.titleLabel.text = text
        self.amountLabel.text = "1,292,130.00"
    }

    private func setupInitialView() {
        self.backgroundColor = UIColor.white
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
    }

    private func setupConstrint() {

        NSLayoutConstraint.activate([
            topSeparator.leftAnchor.constraint(equalTo: self.leftAnchor),
            topSeparator.rightAnchor.constraint(equalTo: self.rightAnchor),
            topSeparator.topAnchor.constraint(equalTo: self.topAnchor),
            topSeparator.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        titleLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20.0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: amountLabel.leadingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25.0).isActive = true
        
        amountLabel.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        amountLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        amountLabel.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 20.0).isActive = true
        amountLabel.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10.0).isActive = true
        amountLabel.widthAnchor.constraint(equalToConstant: self.frame.width * 0.27).isActive = true

//        NSLayoutConstraint.activate([
//            bottomSeparator.leftAnchor.constraint(equalTo: self.leftAnchor),
//            bottomSeparator.rightAnchor.constraint(equalTo: self.rightAnchor),
//            bottomSeparator.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1),
//            bottomSeparator.heightAnchor.constraint(equalToConstant: 1)
//        ])
    }
}

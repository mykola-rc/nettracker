//
//  TableFooterView.swift
//  Net Worth Tracker
//
//  Created by Mykola Burynok on 2019-10-04.
//  Copyright © 2019 Mykola Burynok. All rights reserved.
//

import UIKit

public class TableFooterView: UIView {
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

    private lazy var amountContainer: UIView = {
        let aView = UIView()
        aView.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(aView)
        return aView
    }()
    
    private lazy var amountLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        amountContainer.addSubview(label)

        label.font = UIFont.boldSystemFont(ofSize: 16.0)
        label.textColor = UIColor.darkGreen
        return label
    }()
    
    private lazy var bottomSeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    let viewBorder = CAShapeLayer()

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
        self.amountLabel.text = "2,200,427.00"
    }

    private func setupInitialView() {
        self.backgroundColor = UIColor.white
        amountContainer.layer.addSublayer(viewBorder)
    }
    
    public override func layoutSubviews() {
        super.layoutSubviews()
        
        viewBorder.strokeColor = UIColor.black.cgColor
        viewBorder.lineDashPattern = [1, 2]
        viewBorder.frame = self.bounds
        viewBorder.fillColor = nil
        viewBorder.path = UIBezierPath(rect: self.bounds).cgPath
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
        titleLabel.trailingAnchor.constraint(equalTo: amountContainer.leadingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 25.0).isActive = true
        
        amountContainer.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        amountContainer.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        amountContainer.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 20.0).isActive = true
        amountContainer.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        amountContainer.widthAnchor.constraint(equalToConstant: self.frame.width * 0.27).isActive = true

        NSLayoutConstraint.activate(amountLabel.edgeConstraints(top: 5, left: 20, bottom: 5, right: 10))
        
        NSLayoutConstraint.activate([
            bottomSeparator.leftAnchor.constraint(equalTo: self.leftAnchor),
            bottomSeparator.rightAnchor.constraint(equalTo: self.rightAnchor),
            bottomSeparator.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1),
            bottomSeparator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

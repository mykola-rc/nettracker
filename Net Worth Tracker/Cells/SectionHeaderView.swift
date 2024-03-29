//
//  SectionHeaderView.swift
//  Net Worth Tracker
//
//  Created by Nick Burinok on 2019-10-03.
//  Copyright © 2019 Mykola Burynok. All rights reserved.
//

import UIKit

public class SectionHeaderView: UIView {
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
        label.textColor = UIColor.gray
        return label
    }()

    private lazy var bottomSeparator: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        self.addSubview(view)
        view.backgroundColor = UIColor.lightGray
        return view
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
    }

    private func setupInitialView() {
        self.backgroundColor = UIColor.white
    }

    private func setupConstrint() {

        NSLayoutConstraint.activate([
            topSeparator.leftAnchor.constraint(equalTo: self.leftAnchor),
            topSeparator.rightAnchor.constraint(equalTo: self.rightAnchor),
            topSeparator.topAnchor.constraint(equalTo: self.topAnchor),
            topSeparator.heightAnchor.constraint(equalToConstant: 1)
        ])
        
        NSLayoutConstraint.activate(titleLabel.edgeConstraints(top: 5, left: 20, bottom: 5, right: 10))
        titleLabel.heightAnchor.constraint(equalToConstant: 44.0).isActive = true

        NSLayoutConstraint.activate([
            bottomSeparator.leftAnchor.constraint(equalTo: self.leftAnchor),
            bottomSeparator.rightAnchor.constraint(equalTo: self.rightAnchor),
            bottomSeparator.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -1),
            bottomSeparator.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
}

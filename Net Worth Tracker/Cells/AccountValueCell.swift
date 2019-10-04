//
//  AccountValueCell.swift
//  Net Worth Tracker
//
//  Created by Nick Burinok on 2019-10-02.
//  Copyright © 2019 Mykola Burynok. All rights reserved.
//

import UIKit

class AccountValueCell: UITableViewCell, CellConfigurable {

    fileprivate let titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.text = "Some Text Here"
        lbl.textColor = .lightGray
        lbl.translatesAutoresizingMaskIntoConstraints = false
        return lbl
    }()
    
    let viewBorder = CAShapeLayer()
    
    fileprivate let amountContainer = UIView()
    
    fileprivate let amountTextField: UITextField = {
        let txf = UITextField()
        txf.translatesAutoresizingMaskIntoConstraints = false
        return txf
    }()
    
    var viewModel: AccountValueCellViewModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.0).isActive = true
//        titleLabel.trailingAnchor.constraint(equalTo: amountContainer.leadingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 44.0)
        
        amountContainer.translatesAutoresizingMaskIntoConstraints = false
        contentView.addSubview(amountContainer)
        
        amountContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        amountContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        amountContainer.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 20.0).isActive = true
        amountContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        amountContainer.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.35)
        
        amountTextField.placeholder = "placeholder text"
        amountTextField.textAlignment = .right
        amountTextField.textColor = .red
        amountContainer.addSubview(amountTextField)
//
        amountTextField.topAnchor.constraint(equalTo: amountContainer.topAnchor).isActive = true
        amountTextField.bottomAnchor.constraint(equalTo: amountContainer.bottomAnchor).isActive = true
        amountTextField.leadingAnchor.constraint(equalTo: amountContainer.leadingAnchor, constant: 8.0).isActive = true
        amountTextField.trailingAnchor.constraint(equalTo: amountContainer.trailingAnchor, constant: -8.0).isActive = true

        amountContainer.layer.addSublayer(viewBorder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        viewBorder.strokeColor = UIColor.black.cgColor
        viewBorder.lineDashPattern = [1, 2]
        viewBorder.frame = contentView.bounds
        viewBorder.fillColor = nil
        viewBorder.path = UIBezierPath(rect: contentView.bounds).cgPath
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

//    func configure(_ values: [String]) {
//        titleLabel.text = values[0]
//        amountTextField.text = values[1]
//    }
    
    func configure(viewModel: RowViewModel) {
        
        guard let viewModel = viewModel as? AccountValueCellViewModel else { return }
        self.viewModel = viewModel
        
        titleLabel.text = viewModel.title
        amountTextField.text = viewModel.textFieldValue
    }
}

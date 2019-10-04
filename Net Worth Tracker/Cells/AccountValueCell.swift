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
    
    fileprivate let amountContainer: UIView = {
        let aView = UIView()
        aView.translatesAutoresizingMaskIntoConstraints = false
        return aView
    }()
    
    fileprivate let amountTextField: UITextField = {
        let txf = UITextField()
        txf.translatesAutoresizingMaskIntoConstraints = false
        return txf
    }()
    
    var viewModel: AccountValueCellViewModel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        contentView.addSubview(titleLabel)
        contentView.addSubview(amountContainer)
        
        titleLabel.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20.0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: amountContainer.leadingAnchor).isActive = true
        titleLabel.heightAnchor.constraint(equalToConstant: 44.0).isActive = true
        
        amountContainer.topAnchor.constraint(equalTo: contentView.topAnchor).isActive = true
        amountContainer.bottomAnchor.constraint(equalTo: contentView.bottomAnchor).isActive = true
        amountContainer.leadingAnchor.constraint(equalTo: titleLabel.trailingAnchor, constant: 20.0).isActive = true
        amountContainer.trailingAnchor.constraint(equalTo: contentView.trailingAnchor).isActive = true
        amountContainer.widthAnchor.constraint(equalToConstant: contentView.frame.width * 0.35).isActive = true
        
        amountTextField.textAlignment = .right
        amountTextField.textColor = .red
        amountTextField.delegate = self
        amountTextField.keyboardType = .decimalPad
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
    
    func configure(viewModel: RowViewModel) {
        
        guard let viewModel = viewModel as? AccountValueCellViewModel else { return }
        self.viewModel = viewModel
        
        titleLabel.text = viewModel.title
        amountTextField.text = viewModel.textFieldValue
    }
}

extension AccountValueCell: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        if ((string == "0" || string == "") && (textField.text! as NSString).range(of: ".").location < range.location) {
            return true
        }

        // First check whether the replacement string's numeric...
        let cs = NSCharacterSet(charactersIn: "0123456789.").inverted
        let filtered = string.components(separatedBy: cs)
        let component = filtered.joined(separator: "")
        let isNumeric = string == component

        // Then if the replacement string's numeric, or if it's
        // a backspace, or if it's a decimal point and the text
        // field doesn't already contain a decimal point,
        // reformat the new complete number using
        if isNumeric {
            let formatter = NumberFormatter()
            formatter.numberStyle = .decimal
            formatter.maximumFractionDigits = 2
            // Combine the new text with the old; then remove any
            // commas from the textField before formatting
            let newString = (textField.text! as NSString).replacingCharacters(in: range, with: string)
            let numberWithOutCommas = newString.replacingOccurrences(of: ",", with: "")
            let number = formatter.number(from: numberWithOutCommas)
            if number != nil {
                var formattedString = formatter.string(from: number!)
                // If the last entry was a decimal or a zero after a decimal,
                // re-add it here because the formatter will naturally remove
                // it.
                if string == "." && range.location == textField.text?.count {
                    formattedString = formattedString?.appending(".")
                }
                textField.text = formattedString
            } else {
                textField.text = nil
            }
        }
        return false

    }
}

extension String {
    func formatToNumberWithComma() -> String? {
        
        return nil
    }
}

//
//  ViewController.swift
//  Net Worth Tracker
//
//  Created by Mykola Burynok on 2019-10-01.
//  Copyright © 2019 Mykola Burynok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    private let numberOfColumns: CGFloat = 2.0
    private let cellHeight: CGFloat = 44.0
    
    // TODO: need to be raplaced with View Models
    private let accountNames = ["Chequing", "2000.00", "Savings for Taxes", "4000.00", "Rainy Day Fund", "506.00", "Savings for Fun", "5000.00", "Savings for Travel", "400.0", "Savings for Personal Development", "200.0", "Investment 1", "5000.00", "Investment 2", "60,000.00", "Investment 3", "30,000.00", "Investment 4", "50,000.00", "Investment 5", "24,000.00"]
    
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.register(AccountNameCell.self, forCellWithReuseIdentifier: AccountNameCell.reuseIdentifier)
        cv.register(AccountAmountCell.self, forCellWithReuseIdentifier: AccountAmountCell.reuseIdentifier)
        return cv
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        view.addSubview(collectionView)
        
        let guide = self.view.safeAreaLayoutGuide
        collectionView.topAnchor.constraint(equalTo: guide.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: guide.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: guide.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: guide.trailingAnchor).isActive = true
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension ViewController: UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return accountNames.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.item % 2 == 0 {
            let cellTitle = accountNames[indexPath.item]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountNameCell.reuseIdentifier, for: indexPath) as! AccountNameCell
            cell.configure(cellTitle)
            return cell
        } else {
            let accountAmount = accountNames[indexPath.item]
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: AccountAmountCell.reuseIdentifier, for: indexPath) as! AccountAmountCell
            cell.configure(accountAmount)
            return cell
        }
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        if indexPath.item % 2 == 0 {
            let cellWidth = collectionView.frame.width * 0.65
            return CGSize(width: cellWidth, height: cellHeight)
        } else {
            let cellWidth = collectionView.frame.width * 0.35
            return CGSize(width: cellWidth, height: cellHeight)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets.zero
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
}

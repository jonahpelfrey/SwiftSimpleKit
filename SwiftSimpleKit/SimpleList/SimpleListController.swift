//
//  SimpleListController.swift
//  SwiftSimpleKit
//
//  Created by Jonah Pelfrey on 10/23/19.
//  Copyright © 2019 Jonah Pelfrey. All rights reserved.
//

import UIKit
import Combine

open class SimpleListController<Cell: UICollectionViewCell & SimpleListCellCompatible>: Controller<SimpleListView<Cell>>, UICollectionViewDelegate {
    
    var dataSource: UICollectionViewDiffableDataSource<Section, Cell.DataObjectType>!
    
    enum Section: CaseIterable {
        case main
    }
    
    override open func configure() {
        super.configure()
        configureDelegates()
        configureDataSource()
    }
    
    private func configureDelegates() {
        childView.collectionView.register(Cell.self, forCellWithReuseIdentifier: Cell.reuseIdentifier)
        childView.collectionView.delegate = self
    }
    
    private func configureDataSource() {
        self.dataSource = UICollectionViewDiffableDataSource<Section, Cell.DataObjectType>(collectionView: childView.collectionView, cellProvider: { (collectionView, indexPath, item) -> UICollectionViewCell? in
            guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Cell.reuseIdentifier, for: indexPath) as? Cell else { return UICollectionViewCell() }
            cell.setData(item, indexPath)
            return cell
        })
    }
    
    open func updateDataSource(_ data: [Cell.DataObjectType]) {
        var snapshot = NSDiffableDataSourceSnapshot<Section, Cell.DataObjectType>()
        snapshot.appendSections([.main])
        snapshot.appendItems(data)
        self.dataSource.apply(snapshot, animatingDifferences: true)
    }
}

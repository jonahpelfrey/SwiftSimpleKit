//
//  ExampleListCell.swift
//  SwiftSimpleKitExamples
//
//  Created by Jonah Pelfrey on 10/23/19.
//  Copyright © 2019 Jonah Pelfrey. All rights reserved.
//

import UIKit
import SwiftSimpleKit

class ExampleListCell: UICollectionViewCell, SimpleListCellCompatible {
    
    lazy var valueLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 24, weight: .heavy)
        return label
    }()
    
    static var reuseIdentifier: String = "reuseIdentifier"
    static var height: CGFloat = 300
    static var spacing: CGFloat = 10
    static var contentInsets: NSDirectionalEdgeInsets = .init(top: 10, leading: 10, bottom: 10, trailing: 10)
    
    func setData(_ data: UIColor, _ indexPath: IndexPath) {
        valueLabel.text = "\(indexPath.row)"
        backgroundColor = data
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureSubviews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configureSubviews() {
        contentView.addSubview(valueLabel)
        NSLayoutConstraint.activate([
            valueLabel.centerXAnchor.constraint(equalTo: centerXAnchor),
            valueLabel.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
    
    override func layoutSubviews() {
        layer.cornerRadius = 8
    }
}

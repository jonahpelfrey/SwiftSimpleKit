//
//  SimpleListCellCompatible.swift
//  SwiftSimpleKit
//
//  Created by Jonah Pelfrey on 10/23/19.
//  Copyright © 2019 Jonah Pelfrey. All rights reserved.
//

import UIKit

public protocol SimpleListCellCompatible: class {
    associatedtype DataObjectType: Hashable
    func setData(_ data: DataObjectType, _ indexPath: IndexPath)
    
    static var reuseIdentifier: String { get }
    static var height: CGFloat { get }
    static var spacing: CGFloat { get }
    static var contentInsets: NSDirectionalEdgeInsets { get }
}

//
//  ControllerView.swift
//  SwiftSimpleKit
//
//  Created by Jonah Pelfrey on 10/23/19.
//  Copyright © 2019 Jonah Pelfrey. All rights reserved.
//

import UIKit

open class ControllerView: UIView {
    
    required public init(controller: UIViewController) {
        super.init(frame: .zero)
        
        controller.view.addSubview(self)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            self.topAnchor.constraint(equalTo: controller.view.topAnchor),
            self.bottomAnchor.constraint(equalTo: controller.view.bottomAnchor),
            self.leadingAnchor.constraint(equalTo: controller.view.leadingAnchor),
            self.trailingAnchor.constraint(equalTo: controller.view.trailingAnchor)
        ])
        
        configureSubviews()
    }
    
    required public init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureSubviews() {}
}

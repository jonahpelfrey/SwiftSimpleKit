//
//  Controller.swift
//  SwiftSimpleKit
//
//  Created by Jonah Pelfrey on 10/23/19.
//  Copyright © 2019 Jonah Pelfrey. All rights reserved.
//

import UIKit

open class Controller<View: ControllerView>: UIViewController {
    var childView: View!
    
    override open func loadView() {
        super.loadView()
        self.childView = View(controller: self)
        configure()
    }
    
    open func configure() {}
}

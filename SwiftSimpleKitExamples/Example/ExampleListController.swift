//
//  ExampleListController.swift
//  SwiftSimpleKitExamples
//
//  Created by Jonah Pelfrey on 10/23/19.
//  Copyright © 2019 Jonah Pelfrey. All rights reserved.
//

import UIKit
import Combine
import SwiftSimpleKit

class ExampleListController: SimpleListController<ExampleListCell> {
    
    var subscription: AnyCancellable?
    var viewModel = ExampleListViewModel()
    
    override func configure() {
        super.configure()
        configureSubscriptions()
    }
    
    private func configureSubscriptions() {
        self.subscription = viewModel.subject
        .receive(on: RunLoop.main)
        .sink(receiveValue: { [weak self] values in
            self?.updateDataSource(values)
        })
    }
}

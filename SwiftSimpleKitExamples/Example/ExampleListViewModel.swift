//
//  ExampleListViewModel.swift
//  SwiftSimpleKitExamples
//
//  Created by Jonah Pelfrey on 10/23/19.
//  Copyright © 2019 Jonah Pelfrey. All rights reserved.
//

import Combine
import UIKit

class ExampleListViewModel {
    
    var subject = CurrentValueSubject<[UIColor], Never>([])
    
    init() {
        subject.send([
            .systemRed,
            .systemOrange,
            .systemYellow,
            .systemGreen,
            .systemBlue,
            .systemPurple,
            .systemPink
        ])
    }
}

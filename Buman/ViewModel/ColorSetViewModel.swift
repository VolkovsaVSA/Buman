//
//  ListColorSetViewModel.swift
//  Buman
//
//  Created by Sergey Volkov on 16.06.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation

final class ColorSetViewModel: ObservableObject {
    @Published var colorSet = ColorSet2
    
    func clearIsSelected() {
        colorSet = ColorSet2
    }
}



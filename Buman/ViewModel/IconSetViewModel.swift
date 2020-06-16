//
//  IconSetViewModel.swift
//  Buman
//
//  Created by Sergey Volkov on 16.06.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation

final class IconSetViewModel: ObservableObject {
    @Published var iconSet = IconSet
    
    func clearIsSelected() {
        iconSet = IconSet
    }
}

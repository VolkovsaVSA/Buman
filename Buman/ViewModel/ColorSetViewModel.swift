//
//  ListColorSetViewModel.swift
//  Buman
//
//  Created by Sergey Volkov on 16.06.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation
import SwiftUI

final class ColorSetViewModel: ObservableObject {
    @Published var colorSet = ColorSet
    
    func clearIsSelected() {
        colorSet = ColorSet
    }
    
    func selectedColor()-> Color {
        var selectedColor = Color.red
        colorSet.forEach { colorSetRow in
            colorSetRow.forEach { color in
                if color.isSelected {
                    selectedColor = color.color
                }
            }
        }
        return selectedColor
    }
}



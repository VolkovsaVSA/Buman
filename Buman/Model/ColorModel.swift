//
//  ListColorSetModel.swift
//  Buman
//
//  Created by Sergey Volkov on 15.06.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation
import SwiftUI

struct ColorModel: Identifiable, Hashable {
    
    let id = UUID()
    let color: Color
    var isSelected: Bool
}

var ColorSet1 = [
    ColorModel(color: Color(.systemRed), isSelected: false),
    ColorModel(color: Color(.systemOrange), isSelected: false),
    ColorModel(color: Color(.systemYellow), isSelected: false),
    ColorModel(color: Color(.systemGreen), isSelected: false),
    ColorModel(color: Color(.systemBlue), isSelected: false),
    ColorModel(color: Color(.systemTeal), isSelected: false),
    ColorModel(color: Color(.systemPurple), isSelected: false),
    ColorModel(color: Color(.systemPink), isSelected: false),
    ColorModel(color: Color(.systemIndigo), isSelected: false),
    ColorModel(color: Color(.brown), isSelected: false)
]

var ColorSet2 = [
    [
        ColorModel(color: Color(.systemRed), isSelected: false),
        ColorModel(color: Color(.systemOrange), isSelected: false),
        ColorModel(color: Color(.systemYellow), isSelected: false),
        ColorModel(color: Color(.systemGreen), isSelected: false),
        ColorModel(color: Color(.systemBlue), isSelected: false),
    ],
    [
        ColorModel(color: Color(.systemTeal), isSelected: false),
        ColorModel(color: Color(.systemPurple), isSelected: false),
        ColorModel(color: Color(.systemPink), isSelected: false),
        ColorModel(color: Color(.systemIndigo), isSelected: false),
        ColorModel(color: Color(.brown), isSelected: false),
    ]
]


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

var ColorSet = [
    [
        ColorModel(color: Color(.red), isSelected: true),
        ColorModel(color: Color(.systemPink), isSelected: false),
        ColorModel(color: Color(.orange), isSelected: false),
        ColorModel(color: Color(.systemYellow), isSelected: false),
        ColorModel(color: Color(.green), isSelected: false)
    ],
    [
        ColorModel(color: Color(.systemGreen), isSelected: false),
        ColorModel(color: Color(.cyan), isSelected: false),
        ColorModel(color: Color(.systemTeal), isSelected: false),
        ColorModel(color: Color(.systemBlue), isSelected: false),
        ColorModel(color: Color(.blue), isSelected: false),
    ],
    [
        ColorModel(color: Color(.systemIndigo), isSelected: false),
        ColorModel(color: Color(.purple), isSelected: false),
        ColorModel(color: Color(.magenta), isSelected: false),
        ColorModel(color: Color(.brown), isSelected: false),
        ColorModel(color: Color(.darkGray), isSelected: false),
    ]
]


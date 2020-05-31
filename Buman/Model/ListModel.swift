//
//  ListModel.swift
//  Buman
//
//  Created by Sergey Volkov on 26.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation
import SwiftUI

class ListModel: Identifiable, ObservableObject {
    var id = UUID()
    var title: String
    var listRows: [ListRowModel]
    var systemImage: String
    var colorSystemImage: Color
    
    init(title: String, listRows: [ListRowModel], systemImage: String, colorSystemImage: Color) {
        self.title = title
        self.listRows = listRows
        self.systemImage = systemImage
        self.colorSystemImage = colorSystemImage
    }
    
}

var ListOfLists = [
    ListModel(title: "First targets", listRows: ListArray, systemImage: "pencil.tip", colorSystemImage: .red),
    ListModel(title: "Second targets", listRows: [], systemImage: "flag.fill", colorSystemImage: .blue)
]

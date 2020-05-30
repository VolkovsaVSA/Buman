//
//  ListModel.swift
//  Buman
//
//  Created by Sergey Volkov on 26.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation
import UIKit

class ListModel: Identifiable, ObservableObject {
    let id = UUID()
    var title: String
    var listRows: [ListRowModel]
    var systemImage: String
    var colorSystemImage: UIColor
    
    init(title: String, listRows: [ListRowModel], systemImage: String, colorSystemImage: UIColor) {
        self.title = title
        self.listRows = listRows
        self.systemImage = systemImage
        self.colorSystemImage = colorSystemImage
    }
    
}
//
//struct ListModel: Identifiable {
//  var id = UUID()
//  var title: String
//  var listRows: [ListRowModel]
//  var systemImage: String
//  var colorSystemImage: UIColor
//}

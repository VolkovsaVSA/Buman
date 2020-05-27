//
//  ListModel.swift
//  Buman
//
//  Created by Sergey Volkov on 26.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation

class ListModel: Identifiable, ObservableObject {
    let id = UUID().uuidString
    var title: String
    var listRows: [ListRowModel]
    
    init(title: String, listRows: [ListRowModel]) {
        self.title = title
        self.listRows = listRows
    }
    
}

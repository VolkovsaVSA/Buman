//
//  ListViewModel.swift
//  Buman
//
//  Created by Sergey Volkov on 30.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation
import UIKit

class ListViewModel: ObservableObject, Identifiable {
    let id: UUID
    @Published var list: ListModel
    @Published var rows: [ListRowViewModel] = []

    init(list: ListModel) {
        self.list = list
        self.id = list.id
        
        list.listRows.forEach({ row in
            self.rows.append(ListRowViewModel(listRow: row))
        })
    }
}


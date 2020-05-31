//
//  ListViewModel.swift
//  Buman
//
//  Created by Sergey Volkov on 26.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation
import Combine

final class ListRowViewModel: ObservableObject, Identifiable {
    @Published var listRow: ListRowModel
    
    init(listRow: ListRowModel) {
        self.listRow = listRow
    }
}

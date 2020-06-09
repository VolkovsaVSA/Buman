//
//  ListsViewModel.swift
//  Buman
//
//  Created by Sergey Volkov on 30.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation
import Combine

final class ListsViewModel: ObservableObject, Identifiable {
    @Published var lists: [ListViewModel] = []
    
    init() {
        ListOfLists.forEach { list in
            lists.append(ListViewModel(list: list))
        }

    }
}

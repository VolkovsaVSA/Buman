//
//  ListsViewModel.swift
//  Buman
//
//  Created by Sergey Volkov on 30.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation
import Combine

final class ListsViewModel: ObservableObject {
    @Published var lists: [ListViewModel] = [] 
    
    func addList(list: ListModel) {
        lists.append(ListViewModel(list: list))
    }
    
    init() {
        ListOfLists.forEach { list in
            lists.append(ListViewModel(list: list))
        }
        
    }
    
    
    
    
}

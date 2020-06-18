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
    func editList(lvm: ListViewModel) {
        for (index, value) in lists.enumerated() {
            if value.id == lvm.id {
                lists[index] = lvm
            }
        }
    }
    
    init() {
        ListOfLists.forEach { list in
            lists.append(ListViewModel(list: list))
        }
        
    }
    
    
    
    
}

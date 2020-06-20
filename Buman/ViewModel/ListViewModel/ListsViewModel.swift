//
//  ListsViewModel.swift
//  Buman
//
//  Created by Sergey Volkov on 30.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation
import SwiftUI

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
    func getListColor(id: String) -> Color {
        var color = Color.red
        lists.forEach { listVM in
            if id == listVM.id {
                color = listVM.colorSystemImage
            }
        }
        return color
    }
    
    init() {
        ListOfLists.forEach { list in
            lists.append(ListViewModel(list: list))
        }
        
    }
    
    
    
    
}

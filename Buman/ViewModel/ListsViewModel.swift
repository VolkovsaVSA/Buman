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
    
//    private var cancellableSet: Set<AnyCancellable> = []
//    private var anyCancellable: AnyCancellable? = nil
    
    func refreshCount() {
        lists.forEach { listVM in
            listVM.calcCount()
        }
    }
    
    init() {
        ListOfLists.forEach { list in
            lists.append(ListViewModel(list: list))
        }
        
//        self.$lists
//        .dropFirst() // Skips the initial value so you only persist changes
//        .sink { (lists1: [ListViewModel]) in
//            lists1.forEach { (listVM) in
//                listVM.calcCount()
//            }
//        }
//        .store(in: &cancellableSet)
    }
    
    
    
}

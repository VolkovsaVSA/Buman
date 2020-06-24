//
//  ListViewModel.swift
//  Buman
//
//  Created by Sergey Volkov on 30.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation
import SwiftUI
import Combine

final class ListViewModel: ObservableObject, Identifiable {
    
    let id: String
    @Published var title: String
    @Published var systemImage: String
    @Published var colorSystemImage: Color
    @Published var listRowsVM: [ListCellViewModel] = [] 
    @Published var newTask = ""
    
    func addListRow(newList: ListCellModel) {
        let newListRowVM = ListCellViewModel(listRow: newList)
        listRowsVM.append(newListRowVM)
    }
//    func removeListRow(atOffsets: IndexSet) {
//        listRowsVM.remove(atOffsets: atOffsets)
//    }
    
    
    init(list: ListModel) {
        self.id = list.id
        self.title = list.title
        self.systemImage = list.systemImage
        self.colorSystemImage = list.colorSystemImage
        
        list.listRows.forEach({ row in
            self.listRowsVM.append(ListCellViewModel(listRow: row))
        })

    }
    
}


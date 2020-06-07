//
//  ListViewModel.swift
//  Buman
//
//  Created by Sergey Volkov on 30.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation
import SwiftUI

final class ListViewModel: ObservableObject, Identifiable {
    let id: UUID
    @Published var title: String
    @Published var systemImage: String
    @Published var colorSystemImage: Color
    @Published var listRowsVM: [ListRowViewModel] = []
    @Published var newTask = ""
    
    func addListRow(newList: ListRowModel) {
        let newTaskVM = ListRowViewModel(listRow: newList)
        listRowsVM.append(newTaskVM)
    }
    func removeListRow(atOffsets: IndexSet) {
        listRowsVM.remove(atOffsets: atOffsets)
    }
    func listRowVMCount()->Int {
        return listRowsVM.count
    }
    
    
    init(list: ListModel) {
        self.id = list.id
        self.title = list.title
        self.systemImage = list.systemImage
        self.colorSystemImage = list.colorSystemImage
        
        list.listRows.forEach({ row in
            self.listRowsVM.append(ListRowViewModel(listRow: row))
        })
       
        
    }
    
}


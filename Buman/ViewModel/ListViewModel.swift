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
    @Published var listRowsVM: [ListRowViewModel] = [] {
        didSet {
            listRowVMCount = listRowsVM.count
        }
    }
    @Published var newTask = ""
    @Published var listRowVMCount: Int
    
    func addListRow(newList: ListRowModel) {
        let newListRowVM = ListRowViewModel(listRow: newList)
        listRowsVM.append(newListRowVM)
    }
    func removeListRow(atOffsets: IndexSet) {
        listRowsVM.remove(atOffsets: atOffsets)
    }
    func calcCount() {
        listRowVMCount = listRowsVM.count
    }
    
    
    init(list: ListModel) {
        self.id = list.id
        self.title = list.title
        self.systemImage = list.systemImage
        self.colorSystemImage = list.colorSystemImage
        self.listRowVMCount = list.listRows.count
        
        list.listRows.forEach({ row in
            self.listRowsVM.append(ListRowViewModel(listRow: row))
        })

    }
    
}


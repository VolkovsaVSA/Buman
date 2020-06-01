//
//  ListViewModel.swift
//  Buman
//
//  Created by Sergey Volkov on 26.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation

final class ListRowViewModel: ObservableObject, Identifiable {
    @Published var title: String
    @Published var isExpand: Bool
    @Published var isComplete: Bool
    @Published var subListRowsVM: [ListRowViewModel] = []
    
    func isCompleteCheck() -> String {
        return isComplete ? "checkmark.circle.fill" : "circle"
    }
    func moreButton() -> String {
        return (subListRowsVM.count > 0) ? "chevron.right" : "plus.circle"
    }
    func expandSublist() {
        if !subListRowsVM.isEmpty {
            isExpand.toggle()
        }
    }
    
    init(listRow: ListRowModel) {
        self.title = listRow.title
        self.isExpand = listRow.isExpand
        self.isComplete = listRow.isComplete
        
        listRow.subLists.forEach { subListRow in
            self.subListRowsVM.append(ListRowViewModel(listRow: subListRow))
        }
    }
}

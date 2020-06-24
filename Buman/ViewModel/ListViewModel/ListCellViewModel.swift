//
//  ListViewModel.swift
//  Buman
//
//  Created by Sergey Volkov on 26.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation
import SwiftUI

final class ListCellViewModel: ObservableObject, Identifiable {
    @Published var title: String
    @Published var isExpand: Bool
    @Published var isComplete: Bool {
        didSet {
            changeSublistIsComplete(subListVM: subListRowsVM)
        }
    }
    @Published var subListRowsVM: [ListCellViewModel] = [] {
        didSet {
            if subListRowsVM.isEmpty {
                fontWeight = .regular
            } else {
                fontWeight = .bold
            }
        }
    }
    @Published var isEditing = false
    @Published var isDelete = false
    
    var fontWeight: Font.Weight
    
    static func newListRow() -> ListCellViewModel {
      ListCellViewModel(listRow: ListCellModel(title: "", isExpand: false, isComplete: false, subLists: []))
    }
    
    
    func isCompleteCheck() -> String {
        return isComplete ? "checkmark.circle.fill" : "circle"
    }
    func moreButton() -> String {
        return (subListRowsVM.count > 0) ? "chevron.right.circle" : ""
    }
    func moreButtonColor() -> Color {
        return isExpand ? .gray : .blue
    }
    func expandSublist() {
        if !subListRowsVM.isEmpty {
            isExpand.toggle()
        }
    }
    func removeSublistItem(atOffsets: IndexSet) {
        subListRowsVM.remove(atOffsets: atOffsets)
    }
    func removeSublistItemAtIndex(index: Int) {
        subListRowsVM.remove(at: index)
    }
    func addSublistRow(newList: ListCellModel) {
        let newListRowVM = ListCellViewModel(listRow: newList)
        subListRowsVM.append(newListRowVM)
    }
    
    private func changeSublistIsComplete(subListVM: [ListCellViewModel]) {
        for (_, value) in subListVM.enumerated() {
            value.isComplete = isComplete
            changeSublistIsComplete(subListVM: value.subListRowsVM)
        }
    }
    
    
    init(listRow: ListCellModel) {
        self.title = listRow.title
        self.isExpand = listRow.isExpand
        self.isComplete = listRow.isComplete
        self.fontWeight = listRow.subLists.isEmpty ? .regular: .bold
        
        listRow.subLists.forEach { subListRow in
            self.subListRowsVM.append(ListCellViewModel(listRow: subListRow))
        }
    }
}

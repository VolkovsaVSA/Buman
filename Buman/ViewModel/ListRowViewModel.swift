//
//  ListViewModel.swift
//  Buman
//
//  Created by Sergey Volkov on 26.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation
import SwiftUI

final class ListRowViewModel: ObservableObject, Identifiable {
    @Published var title: String
    @Published var isExpand: Bool
    @Published var isComplete: Bool {
        didSet {
            changeSublistIsComplete(subListVM: subListRowsVM)
        }
    }
    @Published var subListRowsVM: [ListRowViewModel] = [] {
        didSet {
            if subListRowsVM.isEmpty {
                fontWeight = .regular
            } else {
                fontWeight = .bold
            }
        }
    }
    var fontWeight: Font.Weight
    @Published var isEditing = false
    @Published var newTask = ""
    
    static func newListRow() -> ListRowViewModel {
      ListRowViewModel(listRow: ListRowModel(title: "", isExpand: false, isComplete: false, subLists: []))
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
    
    private func changeSublistIsComplete(subListVM: [ListRowViewModel]) {
        for (_, value) in subListVM.enumerated() {
            value.isComplete = isComplete
            changeSublistIsComplete(subListVM: value.subListRowsVM)
        }
    }
    
    
    init(listRow: ListRowModel) {
        self.title = listRow.title
        self.isExpand = listRow.isExpand
        self.isComplete = listRow.isComplete
        self.fontWeight = listRow.subLists.isEmpty ? .regular: .bold
        
        listRow.subLists.forEach { subListRow in
            self.subListRowsVM.append(ListRowViewModel(listRow: subListRow))
        }
    }
}

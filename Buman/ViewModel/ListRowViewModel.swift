//
//  ListViewModel.swift
//  Buman
//
//  Created by Sergey Volkov on 26.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation
import Combine

class ListRowViewModel: ObservableObject, Identifiable {
    @Published var listRow: ListRowModel
    
    @Published var completionStateIconName = ""
    
    private var cancellables = Set<AnyCancellable>()
    
    init(listRow: ListRowModel) {
        self.listRow = listRow
        
//        $listRow // (8)
//            .map { $0.isComplete ? "checkmark.circle.fill" : "circle" }
//            .assign(to: \.completionStateIconName, on: self)
//            .store(in: &cancellables)
    }
}

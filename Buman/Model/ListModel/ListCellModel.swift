//
//  ListModel.swift
//  Buman
//
//  Created by Sergey Volkov on 15.05.2020.
//  Copyright © 2020 Sergey Volkov. All rights reserved.
//

import Foundation

struct ListCellModel: Identifiable {
    let id = UUID().uuidString
    var title: String
    var isExpand: Bool
    var isComplete: Bool
    var subLists: [ListCellModel]
    
    init(title: String, isExpand: Bool, isComplete: Bool, subLists: [ListCellModel]) {
        self.title = title
        self.isExpand = isExpand
        self.isComplete = isComplete
        self.subLists = subLists
    }
}


var ListArray = [
    ListCellModel(title: "Kyle Reese", isExpand: false, isComplete: false, subLists: []),
    ListCellModel(title: "Sarah Connor", isExpand: false, isComplete: false, subLists: [
        ListCellModel(title: "John Connor", isExpand: false, isComplete: false, subLists: [
            ListCellModel(title: "T800", isExpand: false, isComplete: false, subLists: [
                ListCellModel(title: "T1000", isExpand: false, isComplete: false, subLists: []),
                ListCellModel(title: "T1000", isExpand: false, isComplete: false, subLists: []),
                ListCellModel(title: "T1000", isExpand: false, isComplete: false, subLists: [])
            ])
        ]),
        ListCellModel(title: "John Connor", isExpand: false, isComplete: false, subLists: []),
        ListCellModel(title: "John Connor", isExpand: false, isComplete: false, subLists: [])
    ]),
    ListCellModel(title: "Mile Dyson", isExpand: false, isComplete: false, subLists: []),
    ListCellModel(title: "T800", isExpand: false, isComplete: false, subLists: []),
    ListCellModel(title: "T1000", isExpand: false, isComplete: false, subLists: [])
]





//
//  ListModel.swift
//  Buman
//
//  Created by Sergey Volkov on 15.05.2020.
//  Copyright © 2020 Sergey Volkov. All rights reserved.
//

import Foundation

class ListRowModel: Identifiable, ObservableObject {
    let id = UUID()
    var title: String
    var isExpand: Bool
    var isComplete: Bool
    var subLists: [ListRowModel]
    
    init(title: String, isExpand: Bool, isComplete: Bool, subLists: [ListRowModel]) {
        self.title = title
        self.isExpand = isExpand
        self.isComplete = isComplete
        self.subLists = subLists
    }
}


var ListArray = [
    ListRowModel(title: "Kyle Reese", isExpand: false, isComplete: false, subLists: []),
    ListRowModel(title: "Sarah Connor", isExpand: true, isComplete: false, subLists: [
        ListRowModel(title: "John Connor", isExpand: false, isComplete: false, subLists: [])
    ]),
    ListRowModel(title: "Mile Dyson", isExpand: false, isComplete: false, subLists: []),
    ListRowModel(title: "T800", isExpand: false, isComplete: false, subLists: []),
    ListRowModel(title: "T1000", isExpand: false, isComplete: false, subLists: [])
]


var ListOfLists = [
    ListModel(title: "My", listRows: ListArray, systemImage: "calendar", colorSystemImage: .blue),
    ListModel(title: "Home", listRows: [], systemImage: "calendar", colorSystemImage: .blue),
    ListModel(title: "Work", listRows: [], systemImage: "calendar", colorSystemImage: .blue),
    ListModel(title: "Gym", listRows: ListArray, systemImage: "calendar", colorSystemImage: .blue),
    ListModel(title: "By", listRows: [], systemImage: "calendar", colorSystemImage: .blue),
]


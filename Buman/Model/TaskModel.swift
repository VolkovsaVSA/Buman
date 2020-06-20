//
//  TaskModel.swift
//  Buman
//
//  Created by Sergey Volkov on 19.06.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift


struct TaskModel: Codable, Identifiable {
    @DocumentID var id: String?
    @ServerTimestamp var createdTime: Timestamp?
    var title: String
    var text: String
    let creatorID: String
//    var startDate: Date
//    var endDate: Date
//    var completed: Bool
//    var responsible: String
}


var TempTasks = [
    TaskModel(id: UUID().uuidString, createdTime: Timestamp(date: Date()), title: "First task", text: "It is first task in this app!!!", creatorID: "1"),
    TaskModel(id: UUID().uuidString, createdTime: Timestamp(date: Date()), title: "Second task", text: "It is second task in this app!!!", creatorID: "1"),
    TaskModel(id: UUID().uuidString, createdTime: Timestamp(date: Date()), title: "Third task", text: "It is third task in this app!!!", creatorID: "1"),
    ]

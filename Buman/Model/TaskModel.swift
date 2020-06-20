//
//  TaskModel.swift
//  Buman
//
//  Created by Sergey Volkov on 19.06.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation


struct TaskModel {
    let id = UUID()
    var title: String
    var text: String
    var startDate: Date
    var endDate: Date
    var completed: Bool
    let creatorID: String
    var responsible: String
}

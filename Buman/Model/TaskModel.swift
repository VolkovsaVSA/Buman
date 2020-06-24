//
//  TaskModel.swift
//  Buman
//
//  Created by Sergey Volkov on 19.06.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation
import FirebaseFirestore
//import SwiftUI
//import FirebaseFirestoreSwift


struct TaskModel: Codable, Identifiable {
    var id: String
    var createdTime: Timestamp
    var title: String
    var text: String
    let creatorID: String
//    var startDate: Date
//    var endDate: Date
//    var completed: Bool
//    var responsible: String
}

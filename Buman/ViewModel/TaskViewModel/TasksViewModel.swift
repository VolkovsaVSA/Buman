//
//  TasksViewModel.swift
//  Buman
//
//  Created by Sergey Volkov on 20.06.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class TasksViewModel: ObservableObject {
    @Published var tasks = [TaskModel]()
    
    private var db = Firestore.firestore()
    
    init() {
        TempTasks.forEach { taskModel in
            tasks.append(taskModel)
        }
    }
}

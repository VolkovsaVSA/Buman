//
//  TasksViewModel.swift
//  Buman
//
//  Created by Sergey Volkov on 20.06.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation
import FirebaseFirestore
//import FirebaseFirestoreSwift

class TasksViewModel: ObservableObject {
    @Published var tasks = [TaskModel]()
    @Published var height: CGFloat = 55
    private var db = Firestore.firestore()
    
    func fetchData() {
        FirestoreManager.addTaskListener { tasks in
            self.tasks = tasks
            self.height = 53 * CGFloat(self.tasks.count)
        }
    }
    
    init() {
        fetchData()
    }
}

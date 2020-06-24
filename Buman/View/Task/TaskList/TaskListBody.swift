//
//  TaskListBody.swift
//  Buman
//
//  Created by Sergey Volkov on 24.06.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct TaskListBody: View {
    
    @EnvironmentObject var tasksVM: TasksViewModel
    
    var body: some View {
        List {
            ForEach(tasksVM.tasks) { task in
                VStack(alignment: .leading, spacing: 0) {
                    Text(task.title)
                        .font(.headline)
                    Text(task.id)
                        .fontWeight(.thin)
                }
                .lineLimit(1)
                //.minimumScaleFactor(0.5)
            }.onDelete { indexSet in
                let deletedTask = self.tasksVM.tasks[indexSet.first!]
                FirestoreManager.removeTask(task: deletedTask)
            }
        }
        .cornerRadius(12)
        .frame(height: self.tasksVM.height)
        .introspectTableView(customize: { tableView in
            tableView.isScrollEnabled = false
            tableView.separatorStyle = .none
        })
    }
}

struct TaskListBody_Previews: PreviewProvider {
    static var previews: some View {
        TaskListBody()
            .environmentObject(TasksViewModel())
    }
}

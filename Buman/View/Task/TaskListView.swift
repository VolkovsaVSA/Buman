//
//  TaskListView.swift
//  Buman
//
//  Created by Sergey Volkov on 31.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct TaskListView: View {
    
    @ObservedObject var tasksVM: TasksViewModel
    @State private var showModal = false
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            HStack {
                Text("Today")
                    .font(.system(size: 26, weight: .bold))
                //.shadow(radius: 6, x: 3, y: 3)
                Spacer()
                Button(action: {
                    self.showModal.toggle()
                }) {
                    HStack{
                        Image(systemName: "plus.circle.fill")
                        Text("Add task")
                    }
                        //.font(Font.system(size: 22))
                        .font(Font.system(size: 20, weight: .medium, design: .default))
                        .foregroundColor(.red)
                    //                    .shadow(radius: 6, x: 3, y: 3)
                }
            }
            List {
                ForEach(tasksVM.tasks) { task in
                    VStack(alignment: .leading, spacing: 0) {
                        Text(task.title)
                            .font(.headline)
                        Text(task.text)
                            .fontWeight(.thin)
                        
                    }
                }.onDelete { indexSet in
                    self.tasksVM.tasks.remove(atOffsets: indexSet)
                }
            }
            
            .cornerRadius(12)
            .introspectTableView(customize: { tableView in
                tableView.isScrollEnabled = false
                tableView.separatorStyle = .none
            })
                .frame(height: 53 * CGFloat(self.tasksVM.tasks.count))
        }
        .sheet(isPresented: $showModal) {
            AddTaskView()
                .environmentObject(self.tasksVM)
        }
    }
    
    
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(tasksVM: TasksViewModel())
    }
}

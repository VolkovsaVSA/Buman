//
//  TaskListHeader.swift
//  Buman
//
//  Created by Sergey Volkov on 24.06.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct TaskListHeader: View {
    
    @EnvironmentObject var tasksVM: TasksViewModel
    @State private var showModal = false
    
    var body: some View {
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
        .sheet(isPresented: $showModal) {
            AddTaskView()
                .environmentObject(self.tasksVM)
        }
    }
}

struct TaskListHeader_Previews: PreviewProvider {
    static var previews: some View {
        TaskListHeader()
    }
}

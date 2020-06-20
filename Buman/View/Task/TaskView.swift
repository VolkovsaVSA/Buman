//
//  TaskView.swift
//  Buman
//
//  Created by Sergey Volkov on 27.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct TaskView: View {
    
    @EnvironmentObject var tasksVM: TasksViewModel
    
    var body: some View {
        
        
        ZStack {
            ScrollView {
                ZStack {
                    VStack(alignment: .center, spacing: 20) {
                        HStack(spacing: 20) {
                            TaskMenuView(title: "Today", count: 12, image: "clock.fill", color: .init(.systemYellow))
                                .cornerRadius(12)
//                                .shadow(radius: 6, x: 3, y: 3)
                            TaskMenuView(title: "Tomorrow", count: 6, image: "calendar", color: .init(.systemBlue))
                                .cornerRadius(12)
//                                .shadow(radius: 6, x: 3, y: 3)
                        }
                        HStack(spacing: 20) {
                            TaskMenuView(title: "All tasks", count: 25, image: "tray.fill", color: .init(.systemGray))
                                .cornerRadius(12)
//                                .shadow(radius: 6, x: 3, y: 3)
                            TaskMenuView(title: "Control", count: 2, image: "flag.fill", color: .init(.systemRed))
                                .cornerRadius(12)
//                                .shadow(radius: 6, x: 3, y: 3)
                        }
                    }
                }
                .padding(20)
                TaskListView(tasksVM: tasksVM)
                    .padding(.horizontal)
            }.introspectScrollView { scrollView in
                scrollView.showsVerticalScrollIndicator = false
            }
            
        }
        
        //            .sheet(isPresented: $showModal) {
        //                AddNewListView(lvm: self.listVM)
        //                    .environmentObject(self.listsVM)
        //                    .background(Color(.systemGroupedBackground))
        //                    .edgesIgnoringSafeArea(.all)
        //        }
        
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}

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
    
    
    
    var body: some View {
        
        ScrollView {
            TaskMenuView()
                .padding()
            TaskListHeader()
            TaskListBody()
                .padding(.horizontal)
        }
        .introspectScrollView { scrollView in
            scrollView.showsVerticalScrollIndicator = false
        }
        
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView().environmentObject(TasksViewModel())
    }
}

//
//  TaskView.swift
//  Buman
//
//  Created by Sergey Volkov on 27.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct TaskView: View {
    
    private let qqq = ["1", "1", "1", "1", "1", "1","1", "1", "1", "1", "1", "1"]
    
    var body: some View {
        
        
        ZStack {
            
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
                    
                    HStack(spacing: 20) {
                        TaskMenuView(title: "Today", count: 12, image: "clock.fill", color: .init(.systemYellow))
                            .cornerRadius(12)
                        TaskMenuView(title: "Tomorrow", count: 6, image: "calendar", color: .init(.systemBlue))
                            .cornerRadius(12)
                    }
                    HStack(spacing: 20) {
                        TaskMenuView(title: "All tasks", count: 25, image: "tray.fill", color: .init(.systemGray))
                            .cornerRadius(12)
                        TaskMenuView(title: "Control", count: 2, image: "flag.fill", color: .init(.systemRed))
                            .cornerRadius(12)
                    }
                    
                    
                }
                .padding(20)
                
                TaskListView(textArray: qqq)
                .padding(20)
                
            }.introspectScrollView { scrollView in
                scrollView.showsVerticalScrollIndicator = false
            }
            
        }
        
    }
}

struct TaskView_Previews: PreviewProvider {
    static var previews: some View {
        TaskView()
    }
}

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
            //Color(.systemGroupedBackground).edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack(alignment: .leading, spacing: 20) {
//                    Text("Tasks")
//                        .font(.system(size: 34, weight: .bold))
                    HStack(spacing: 20) {
                        TaskMenuView(title: "Today", count: 12, image: "clock.fill", color: .yellow)
                            .cornerRadius(12)
                        TaskMenuView(title: "Tomorrow", count: 6, image: "calendar", color: .blue)
                            .cornerRadius(12)
                    }
                    HStack(spacing: 20) {
                        TaskMenuView(title: "All tasks", count: 25, image: "tray.fill", color: .gray)
                            .cornerRadius(12)
                        TaskMenuView(title: "Control", count: 2, image: "flag.fill", color: .red)
                            .cornerRadius(12)
                    }
                    
                   
                }
                .padding(20)
                
                VStack(alignment: .leading, spacing: 20) {
                    Text("Today")
                        .font(.system(size: 26, weight: .bold))
                    
                    List(qqq, id: \.self) { q in
                        Text(q)
                    }
                    .introspectTableView(customize: { tableView in
                        tableView.isScrollEnabled = false
                        tableView.separatorStyle = .none
                    })
                        .frame(height: 44.4 * CGFloat(qqq.count))
                    
                }
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

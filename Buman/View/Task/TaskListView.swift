//
//  TaskListView.swift
//  Buman
//
//  Created by Sergey Volkov on 31.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct TaskListView: View {
    
    var textArray: [String]
    
    var body: some View {
        
        VStack(alignment: .leading, spacing: 20) {
            Text("Today")
                .font(.system(size: 26, weight: .bold))
            List(textArray, id: \.self) { q in
                Text(q)
            }
            .cornerRadius(12)
            .introspectTableView(customize: { tableView in
                tableView.isScrollEnabled = false
                tableView.separatorStyle = .none
            })
                .frame(height: 44.4 * CGFloat(textArray.count))
            
        }
        
        
        
    }
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView(textArray: ["Hello", "!23123", "123123"])
    }
}

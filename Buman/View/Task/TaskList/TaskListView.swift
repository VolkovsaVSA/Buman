//
//  TaskListView.swift
//  Buman
//
//  Created by Sergey Volkov on 31.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct TaskListView: View {
    

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            TaskListHeader()
            TaskListBody()
        }
    }
    
    
}

struct TaskListView_Previews: PreviewProvider {
    static var previews: some View {
        TaskListView()
    }
}

//
//  TaskMenuView.swift
//  Buman
//
//  Created by Sergey Volkov on 26.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct TaskMenuView: View {
    
    var title: String
    var count: Int
    var image: String
    var color: Color
    
    var body: some View {
        
        ZStack{
            Color("TaskTabColor")
            VStack(alignment: .leading) {
                HStack {
                    TaskImageView(image: image, color: color)
                    Spacer()
                    Text("\(count)")
                        .font(Font.system(.largeTitle).bold())
                }
                Text(title)
                    .font(Font.system(.headline)).foregroundColor(.gray)
            }
        .padding()
        }
    }
}

struct TaskMenuView_Previews: PreviewProvider {
    static var previews: some View {
        TaskMenuView(title: "Today", count: 12, image: "calendar", color: .yellow)
    }
}

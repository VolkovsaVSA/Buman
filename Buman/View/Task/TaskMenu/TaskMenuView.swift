//
//  TaskMenuView.swift
//  Buman
//
//  Created by Sergey Volkov on 24.06.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct TaskMenuView: View {
    
    
    
    
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            HStack(spacing: 20) {
                Button(action: {
                    //action Today
                }) {
                    TaskMenuViewCell(title: "Today", count: 12, image: "clock.fill", color: .init(.systemYellow))
                        .cornerRadius(12)
                        //.shadow(radius: 6, x: 3, y: 3)
                }
                Button(action: {
                    //action Tomorrow
                }) {
                    TaskMenuViewCell(title: "Tomorrow", count: 6, image: "calendar", color: .init(.systemBlue))
                        .cornerRadius(12)
                        //.shadow(radius: 6, x: 3, y: 3)
                }
            }
            HStack(spacing: 20) {
                Button(action: {
                    //action All tasks
                }) {
                    TaskMenuViewCell(title: "All tasks", count: 25, image: "tray.fill", color: .init(.systemGray))
                        .cornerRadius(12)
                        //.shadow(radius: 6, x: 3, y: 3)
                }
                Button(action: {
                    //action Control
                }) {
                    TaskMenuViewCell(title: "Control", count: 2, image: "flag.fill", color: .init(.systemRed))
                        .cornerRadius(12)
                        //.shadow(radius: 6, x: 3, y: 3)
                }
                
            }
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct TaskMenuViewCell_Previews: PreviewProvider {
    static var previews: some View {
        TaskMenuView()
    }
}

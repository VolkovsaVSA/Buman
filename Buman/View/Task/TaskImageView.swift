//
//  TaskImageView.swift
//  Buman
//
//  Created by Sergey Volkov on 26.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct TaskImageView: View {
    
    var image: String
    var color: Color
    
    var body: some View {
        
        ZStack {
            color
            Image(systemName: image)
                .font(.title)
                .foregroundColor(.white)
            
        }
        .frame(width: 50, height: 50)
        .clipShape(Circle())
    }
}

struct TaskImageView_Previews: PreviewProvider {
    static var previews: some View {
        TaskImageView(image: "calendar", color: .blue)
    }
}

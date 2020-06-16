//
//  ColorView.swift
//  Buman
//
//  Created by Sergey Volkov on 16.06.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct ColorView: View {
    
    @State var color: ColorModel
    var size = UIScreen.main.bounds.width/10
    
    var body: some View {
        
        Button(action: {
            
            self.color.isSelected.toggle()
        }) {
            Circle()
            .frame(width: self.size, height: self.size)
            .foregroundColor(color.color)
        }
        
        
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(color: ColorSet2.first!.first!)
    }
}

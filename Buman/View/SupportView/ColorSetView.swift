//
//  ChooseColorView.swift
//  Buman
//
//  Created by Sergey Volkov on 15.06.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct ColorSetView: View {
    
    @ObservedObject var colorsVM: ColorSetViewModel
    var size = UIScreen.main.bounds.width/10
    
    var body: some View {
        
        ZStack {
            VStack {
                ForEach(colorsVM.colorSet, id: \.self) { colors in
                    HStack(spacing: self.size - self.size/2) {
                        ForEach(colors) { color in
                            ColorView(colorSetVM: self.colorsVM, color: color)
                        }
                    }
                    .padding(.top)
                }
            }
        }
        
        
        
    }
    
    
}

struct ChooseColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSetView(colorsVM: ColorSetViewModel())
    }
}

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
                ForEach(colorsVM.colorSet.indices, id:\.self) { index1 in
                    HStack(spacing: self.size - self.size/2) {
                        ForEach(self.colorsVM.colorSet[index1].indices) { index2 in
                            ColorView(colorSetVM: self.colorsVM, color: self.$colorsVM.colorSet[index1][index2])
                            .shadow(radius: 6, x: 3, y: 3)
                                //.shadow(color: Color.gray, radius: 6, x: 3, y: 3)
                        }
                    }
                    .padding([.horizontal, .top])
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

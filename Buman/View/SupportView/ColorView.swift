//
//  ColorView.swift
//  Buman
//
//  Created by Sergey Volkov on 16.06.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct ColorView: View {
    
    @ObservedObject var colorSetVM: ColorSetViewModel
    @State var color: ColorModel
    var size = UIScreen.main.bounds.width/10
    
    var body: some View {
        
        Button(action: {
            self.colorSetVM.clearIsSelected()
            self.color.isSelected.toggle()
            print(self.colorSetVM.colorSet.description)
        }) {
            Circle()
            .frame(width: self.size, height: self.size)
            .foregroundColor(color.color)
        }
        
        
    }
}

//struct ColorView_Previews: PreviewProvider {
//    static var previews: some View {
//        ColorView(color: ColorSet2.first!.first!)
//    }
//}

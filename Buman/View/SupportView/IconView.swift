//
//  IconView.swift
//  Buman
//
//  Created by Sergey Volkov on 16.06.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct IconView: View {
    
    @ObservedObject var iconSetVM: IconSetViewModel
    @Binding var icon: IconModel
    var size = UIScreen.main.bounds.width/10
    
    var body: some View {
        
        Button(action: {
            self.iconSetVM.clearIsSelected()
            self.icon.isSelected = true
        }) {
            IconImageView(image: icon.icon, color: Color(.systemGray2), imageScale: self.size/2)
            .frame(width: self.size, height: self.size)
        }
        
    }
}

//struct IconView_Previews: PreviewProvider {
//    static var previews: some View {
//        IconView(iconSetVM: <#IconSetViewModel#>, icon: IconSet.first!.first!)
//    }
//}

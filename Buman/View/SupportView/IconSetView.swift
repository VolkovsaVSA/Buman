//
//  IconSetView.swift
//  Buman
//
//  Created by Sergey Volkov on 16.06.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct IconSetView: View {
    
    @ObservedObject var iconsVM: IconSetViewModel
    var size = UIScreen.main.bounds.width/10
    
    
    var body: some View {
        
        VStack {
            ForEach(iconsVM.iconSet.indices, id: \.self) { index1 in
                HStack(spacing: self.size - self.size/2) {
                    ForEach(self.iconsVM.iconSet[index1].indices) { index2 in
                        IconView(iconSetVM: self.iconsVM, icon: self.$iconsVM.iconSet[index1][index2])
                        .shadow(radius: 6)
                    }
                }
                .padding([.horizontal, .top])
            }
        }
    }
}

struct IconSetView_Previews: PreviewProvider {
    static var previews: some View {
        IconSetView(iconsVM: IconSetViewModel())
    }
}

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
            ForEach(iconsVM.listIconSet, id: \.self) { icons in
                HStack(spacing: self.size - self.size/2) {
                    ForEach(icons) { icon in
                        IconImageView(image: icon.icon, color: Color(.systemGray2), imageScale: self.size/2)
                            .frame(width: self.size, height: self.size)
                    }
                }
                .padding(.top)
            }
        }
    }
}

struct IconSetView_Previews: PreviewProvider {
    static var previews: some View {
        IconSetView(iconsVM: IconSetViewModel())
    }
}

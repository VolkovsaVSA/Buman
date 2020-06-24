//
//  IconSetViewModel.swift
//  Buman
//
//  Created by Sergey Volkov on 16.06.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Foundation

final class IconSetViewModel: ObservableObject {
    @Published var iconSet = IconSet
    
    func clearIsSelected() {
        iconSet = IconSet
    }
    
    func selectImage(selectedImage: String) {
        clearIsSelected()
        for (index1, _) in iconSet.enumerated() {
            for (index2, value2) in iconSet[index1].enumerated() {
                if value2.icon == selectedImage {
                    iconSet[index1][index2].isSelected = true
                }
            }
        }
    }
    
    func selectedIcon() -> String {
        var selectedIcon = "list.bullet"
        iconSet.forEach { iconSetRow in
            iconSetRow.forEach { icon in
                if icon.isSelected {
                    selectedIcon = icon.icon
                }
            }
        }
        return selectedIcon
    }
}

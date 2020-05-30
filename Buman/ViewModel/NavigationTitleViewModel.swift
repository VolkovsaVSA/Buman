//
//  NavigationTitleViewModel.swift
//  Buman
//
//  Created by Sergey Volkov on 28.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import Combine

final class NavigationTitleViewModel: ObservableObject {
    @Published var title = "Tasks"
    @Published var selectedTab = 0 {
        didSet {
            switch selectedTab {
            case 0: title = "Tasks"
            case 1: title = "Lists"
            default: break
            }
        }
    }
}

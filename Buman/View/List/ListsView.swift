//
//  ListsView.swift
//  Buman
//
//  Created by Sergey Volkov on 26.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct ListsView: View {
    
    @ObservedObject var lists = ListsViewModel()
    
    var body: some View {
        List(lists.lists) { list in
            
            NavigationLink(destination: ListDetailView(list: list)) {
                ListRowView(listRow: list)
            }

            
        }
    }
}

struct ListsView_Previews: PreviewProvider {
    static var previews: some View {
        ListsView()
    }
}

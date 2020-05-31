//
//  ListDetailView.swift
//  Buman
//
//  Created by Sergey Volkov on 30.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct ListView: View {
    
    @ObservedObject var listVM: ListViewModel
    
    var body: some View {
        
        List(listVM.listRowsVM) { listRowVM in
            ListRowView(listRowVM: listRowVM, complete: listRowVM.listRow.isComplete)
        }
        .listStyle(DefaultListStyle())
        .navigationBarTitle("\(listVM.list.title)")
    }
    
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(listVM: ListViewModel(list: ListOfLists.first!))
    }
}

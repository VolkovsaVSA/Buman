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
    @State var presentAddNewItem = false
    
    var body: some View {
        
        List {
            ForEach(listVM.listRowsVM) { listRowVM in
                ListRowView(listRowVM: listRowVM)
            }
            .onDelete { indexSet in
                self.listVM.removeTask(atOffsets: indexSet)
            }
            ListRowView(listRowVM: ListRowViewModel.newListRow()) { result in
                if case .success(let newListRow) = result {
                    self.listVM.addListRow(newList: newListRow)
                }
            }
        }
            
        .animation(.interactiveSpring())
        .listStyle(DefaultListStyle())
        .navigationBarTitle("\(listVM.title)")
        
    }
    
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(listVM: ListViewModel(list: ListOfLists.first!))
    }
}

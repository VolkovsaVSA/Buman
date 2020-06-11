//
//  ListsView.swift
//  Buman
//
//  Created by Sergey Volkov on 26.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct ListsView: View {
    
    //@State private var isEditMode = EditMode.inactive
    @ObservedObject var listsVM: ListsViewModel
   
    var body: some View {
        
        List {
            
            ForEach (listsVM.lists) { list in
                NavigationLink(destination: ListView(listVM: list)
                .onReceive(list.objectWillChange, perform: { _ in
                    self.listsVM.objectWillChange.send()
                })) {
                    HStack {
                        IconImageView(image: list.systemImage, color: list.colorSystemImage, imageScale: 16)
                        Text("\(list.title)")
                        Spacer()
                        Text("\(list.listRowsVM.count)")
                    }
                }
                
                .introspectTableView { (tv) in
                    tv.backgroundColor = UIColor.systemGroupedBackground
                }
            }
            
            
            
            
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        
        
    }
}

struct ListsView_Previews: PreviewProvider {
    static var previews: some View {
        ListsView(listsVM: ListsViewModel())
    }
}

//
//  ListsView.swift
//  Buman
//
//  Created by Sergey Volkov on 26.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct ListsView: View {
    
    @State private var isEditMode = EditMode.inactive
    @ObservedObject var listsVM: ListsViewModel
    
    var body: some View {
        
        List(listsVM.lists.indices, id: \.self) { index in
            
            NavigationLink(destination: ListView(listVM: self.listsVM.lists[index])) {
                HStack {
                    IconImageView(image: self.listsVM.lists[index].systemImage, color: self.listsVM.lists[index].colorSystemImage, imageScale: 16)
                    Text("\(self.listsVM.lists[index].title)")
                    Spacer()
                    Text("\(self.listsVM.lists[index].listRowVMCount)")
                }
            }
            .introspectTableView { (tv) in
                    tv.backgroundColor = UIColor.systemGroupedBackground
            }
            
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        .onAppear {
            self.listsVM.refreshCount()
        }
        
    }
}

struct ListsView_Previews: PreviewProvider {
    static var previews: some View {
        ListsView(listsVM: ListsViewModel())
    }
}

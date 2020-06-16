//
//  ListsView.swift
//  Buman
//
//  Created by Sergey Volkov on 26.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI
import PartialSheet

struct ListsView: View {
    
    @EnvironmentObject var partialSheet: PartialSheetManager
    //@State private var isEditMode = EditMode.inactive
    @ObservedObject var listsVM: ListsViewModel
    @State private var showModal = false
    
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
                    
                .introspectTableView { tv in
                    tv.backgroundColor = UIColor.systemGroupedBackground
                }
            }
            .onDelete { indexSet in
                self.listsVM.lists.remove(atOffsets: indexSet)
            }
            
            
            Button(action: {
                self.showModal.toggle()
            }) {
                HStack(alignment: .center) {
                    Spacer()
                    Image(systemName: "plus.circle.fill")
                        .font(Font.system(size: 20))
                        .foregroundColor(Color(.systemRed))
                    Text("Add new list")
                        .foregroundColor(Color(.systemRed))
                    Spacer()
                }
            }
            
            
        }
        .sheet(isPresented: $showModal) {
            AddNewListView(listsVM: self.listsVM)
                .background(Color(.systemGroupedBackground))
                .edgesIgnoringSafeArea(.all)
            }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
    }
}

struct ListsView_Previews: PreviewProvider {
    static var previews: some View {
        ListsView(listsVM: ListsViewModel())
        .environmentObject(PartialSheetManager())
    }
}

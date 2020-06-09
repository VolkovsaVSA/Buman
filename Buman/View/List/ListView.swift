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
    @State var value: CGFloat = 0
    
    var body: some View {
        
        List {
            ForEach(listVM.listRowsVM) { listRowVM in
                ListRowView(listRowVM: listRowVM)
            }
            .onDelete { indexSet in
                self.listVM.removeListRow(atOffsets: indexSet)
            }
            ListRowView(listRowVM: ListRowViewModel.newListRow()) { result in
                if case .success(let newListRow) = result {
                    self.listVM.addListRow(newList: newListRow)
                }
            }
        }
            .offset(y: -self.value)
            .animation(.spring())
            .onAppear {
                
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notif in
                    let value = notif.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                    let height = value.height
                    self.value = height
                }
                NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) {_ in
                    self.value = 0
                }
                
            }
            
        //.animation(.interactiveSpring())
        .listStyle(DefaultListStyle())
        .navigationBarTitle("\(listVM.title)")
        
    }
    
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(listVM: ListViewModel(list: ListOfLists.first!))
    }
}

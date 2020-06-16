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
    @State var value: CGFloat = 0
    
    
    var body: some View {
        
        List {
            ForEach(listVM.listRowsVM) { listRowVM in
                ListRowView(listRowVM: listRowVM)
            }
            .onDelete { indexSet in
                //self.listVM.removeListRow(atOffsets: indexSet)
                self.listVM.listRowsVM.remove(atOffsets: indexSet)
            }
            ListRowView(listRowVM: ListRowViewModel.newListRow()) { result in
                if case .success(let newListRow) = result {
                    self.listVM.addListRow(newList: newListRow)
                }
            }
        }
        
        .onAppear {
            
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillShowNotification, object: nil, queue: .main) { notif in
                let value = notif.userInfo![UIResponder.keyboardFrameEndUserInfoKey] as! CGRect
                let height = value.height
                let listViewHeight = self.listVM.listRowsVM.count * 44
                let visibleScreenHeight = UIScreen.main.bounds.height - height - 200
                
                let difference = CGFloat(listViewHeight) - visibleScreenHeight
                
                if (difference > 0) && (difference < height - 200) {
                    self.value = difference
                } else if difference > height - 200 {
                    self.value = height
                }
                print(difference)
                print(height)
                print(UIScreen.main.bounds.height)
            }
            NotificationCenter.default.addObserver(forName: UIResponder.keyboardWillHideNotification, object: nil, queue: .main) {_ in
                self.value = 0
            }
            
        }
            
        .listStyle(DefaultListStyle())
        .navigationBarTitle("\(listVM.title)")
        .offset(y: -self.value)
        .animation(.spring())
    }
    
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListView(listVM: ListViewModel(list: ListOfLists.first!))
    }
}

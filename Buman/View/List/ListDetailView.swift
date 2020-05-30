//
//  ListDetailView.swift
//  Buman
//
//  Created by Sergey Volkov on 30.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct ListDetailView: View {
    
    @ObservedObject var listVM: ListViewModel
    
    @State var inCompleet: Bool = false
    
    var body: some View {
        
        List(listVM.rows) { listRowVM in
            
            ListRowView(listRowVM: listRowVM)
            
//            HStack {
//                Image(systemName: self.inComleetCheck(inCompleet: listRowVM.listRow.isComplete))
//                    .onTapGesture {
//                        print("toggle")
//                }
//                Text("\(listRowVM.listRow.title)")
//            }
        }
        .navigationBarTitle("\(listVM.list.title)")
    }
    
    
    private func inComleetCheck(inCompleet: Bool) -> String {
        return inCompleet ? "checkmark.circle.fill" : "circle"
    }
    
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(listVM: ListViewModel(list: ListOfLists.first!))
    }
}

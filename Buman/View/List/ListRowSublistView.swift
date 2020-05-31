//
//  ListRowSublistView.swift
//  Buman
//
//  Created by Sergey Volkov on 31.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct ListRowSublistView: View {
    
    @ObservedObject var listRowVM: ListRowViewModel
    
    var body: some View {
        
        List(listRowVM.subListRowsVM) { sublistRowVM in
            ListRowView(listRowVM: sublistRowVM, complete: sublistRowVM.listRow.isComplete)
            .introspectTableView { (tv) in
                tv.isScrollEnabled = false
            }
        }
        .listStyle(DefaultListStyle())
    }
    
    private func calcHeight(subList: [ListRowViewModel]) -> CGFloat {
        return CGFloat(subList.count * 46 + 30)
    }
}

struct ListRowSublistView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowSublistView(listRowVM: ListRowViewModel(listRow: ListOfLists[0].listRows[1]))
    }
}

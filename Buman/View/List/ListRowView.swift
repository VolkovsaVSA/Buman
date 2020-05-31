//
//  ListRowView.swift
//  Buman
//
//  Created by Sergey Volkov on 30.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct ListRowView: View {
    
    @ObservedObject var listRowVM: ListRowViewModel
    @State var complete: Bool
    
    var body: some View {
        
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: inCompleetCheck(inCompleet: complete /*listRowVM.listRow.isComplete*/))
                    .onTapGesture {
                        self.listRowVM.listRow.isComplete.toggle()
                        self.complete.toggle()
                }
                Text("\(listRowVM.listRow.title)")
            }
            if !listRowVM.subListRowsVM.isEmpty {
                ListRowSublistView(listRowVM: listRowVM)
                    .frame(minHeight: calcHeight(subList: listRowVM.subListRowsVM))
            }
        }
        //.frame(minHeight: calcHeight(subList: listRowVM.subListRowsVM))
        
        
    }
    
    private func inCompleetCheck(inCompleet: Bool) -> String {
        return inCompleet ? "checkmark.circle.fill" : "circle"
    }
    private func calcHeight(subList: [ListRowViewModel]) -> CGFloat {
        return CGFloat(subList.count * 46 + 30)
    }
    //    private func checkSublist(sublist: [ListRowViewModel]) -> some View {
    //        if sublist.count > 0  {
    //            return ListRowSublistView(listRowVM: listRowVM)
    //        } else {
    //            return EmptyView()
    //        }
    //    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(listRowVM: ListRowViewModel(listRow: ListOfLists[0].listRows[1]), complete: ListOfLists[0].listRows[1].isComplete)
    }
}

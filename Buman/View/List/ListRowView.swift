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
                Section {
                    ForEach (listRowVM.subListRowsVM) { listRowVM in
                        ListRowView(listRowVM: listRowVM, complete: listRowVM.listRow.isComplete)
                    }
                }.padding(.leading, 20)
            }
        }
    }
    
    private func inCompleetCheck(inCompleet: Bool) -> String {
        return inCompleet ? "checkmark.circle.fill" : "circle"
    }
    
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(listRowVM: ListRowViewModel(listRow: ListOfLists[0].listRows[1]), complete: ListOfLists[0].listRows[1].isComplete)
    }
}

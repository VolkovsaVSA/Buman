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
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image(systemName: listRowVM.isCompleteCheck())
                    .onTapGesture {
                        self.listRowVM.isComplete.toggle()
                        self.changeSublistIsComplete(listRowVM: self.listRowVM)
                }
                .font(Font.system(size: 20))
                Text("\(listRowVM.title)")
                Spacer()
                Image(systemName: listRowVM.moreButton())
                    .onTapGesture {
                        self.listRowVM.expandSublist()
                }
                .font(Font.system(size: 20))
                .foregroundColor(listRowVM.moreButtonColor())
                .rotationEffect(.degrees(self.listRowVM.isExpand ? 90 : 0)).animation(.interactiveSpring())

            }
            if !listRowVM.subListRowsVM.isEmpty {
                if listRowVM.isExpand {
                    Section {
                        ForEach (listRowVM.subListRowsVM) { sublistRowVM in
                            ListRowView(listRowVM: sublistRowVM)
                        }
                    }
                    .padding(.leading, 20)
                }
            }
        }
    }

    private func changeSublistIsComplete(listRowVM: ListRowViewModel) {
        for (_, value) in listRowVM.subListRowsVM.enumerated() {
            value.isComplete = listRowVM.isComplete
            changeSublistIsComplete(listRowVM: value)
        }
    }
    
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(listRowVM: ListRowViewModel(listRow: ListOfLists[0].listRows[1]))
    }
}

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
                Image(systemName: isCompleteCheck(isComplete: listRowVM.isComplete))
                    .onTapGesture {
                        self.listRowVM.isComplete.toggle()
                        self.changeSublistIsComplete(listRowVM: self.listRowVM)
                }
                Text("\(listRowVM.title)")
            }
            if !listRowVM.subListRowsVM.isEmpty {
                Section {
                    ForEach (listRowVM.subListRowsVM) { sublistRowVM in
                        ListRowView(listRowVM: sublistRowVM)
                    }
                }.padding(.leading, 20)
            }
        }
    }
    
    private func isCompleteCheck(isComplete: Bool) -> String {
        return isComplete ? "checkmark.circle.fill" : "circle"
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

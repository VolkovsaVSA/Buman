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
        HStack {
            Image(systemName: inCompleetCheck(inCompleet: listRowVM.listRow.isComplete))
                .onTapGesture {
                    print("\(self.listRowVM.listRow.title)")
                    print("\(self.listRowVM.listRow.isComplete)")
                    self.listRowVM.listRow.isComplete.toggle()
                    print("toggle()")
                    print("\(self.listRowVM.listRow.isComplete)")
            }
            Text("\(listRowVM.listRow.title)")
        }
    }
    
    private func inCompleetCheck(inCompleet: Bool) -> String {
        return inCompleet ? "checkmark.circle.fill" : "circle"
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(listRowVM: ListRowViewModel(listRow: ListOfLists.first!.listRows.first!))
    }
}

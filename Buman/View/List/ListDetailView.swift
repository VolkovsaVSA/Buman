//
//  ListDetailView.swift
//  Buman
//
//  Created by Sergey Volkov on 30.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct ListDetailView: View {
    
    @ObservedObject var list: ListViewModel
    
    @State var inCompleet: Bool = false
    
    var body: some View {
        
        List(list.rows) { row in
            HStack {
                Image(systemName: self.inComleetCheck(inCompleet: row.listRow.isComplete))
                    .onTapGesture {
                        self.list.rows[0].listRow.isComplete.toggle()
                }
                Text("\(row.listRow.title)")
            }
        }
        .navigationBarTitle("\(list.list.title)")
    }
    
    
    private func inComleetCheck(inCompleet: Bool) -> String {
        return inCompleet ? "checkmark.circle.fill" : "circle"
    }
    
}

struct ListDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ListDetailView(list: ListViewModel(list: ListOfLists.first!))
    }
}

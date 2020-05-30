//
//  ListsView.swift
//  Buman
//
//  Created by Sergey Volkov on 26.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct ListsView: View {
    
    @ObservedObject var listsVM = ListsViewModel()
    
    var body: some View {
        List(listsVM.lists) { list in
            
            NavigationLink(destination: ListDetailView(listVM: list)) {

                HStack {
                    Image(systemName: "\(list.list.systemImage)")
                    //Spacer()
                    Text("\(list.list.title)")
                    Spacer()
                    Text("\(list.rows.count)")
                }


            }

            
        }
    }
}

struct ListsView_Previews: PreviewProvider {
    static var previews: some View {
        ListsView()
    }
}

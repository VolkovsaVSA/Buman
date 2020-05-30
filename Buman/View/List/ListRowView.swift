//
//  ListRowView.swift
//  Buman
//
//  Created by Sergey Volkov on 30.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct ListRowView: View {
    
    @ObservedObject var listRow: ListViewModel
    
    var body: some View {
        
        HStack {
            Image(systemName: "\(listRow.list.systemImage)")
            //Spacer()
            Text("\(listRow.list.title)")
            Spacer()
            Text("\(listRow.rows.count)")
        }
    }
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(listRow: ListViewModel(list: ListOfLists.first!))
    }
}

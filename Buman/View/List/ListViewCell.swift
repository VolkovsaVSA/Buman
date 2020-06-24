//
//  ListRowView.swift
//  Buman
//
//  Created by Sergey Volkov on 30.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct ListViewCell: View {
    @EnvironmentObject var listsVM: ListsViewModel
    @ObservedObject var listRowVM: ListCellViewModel
    @ObservedObject var listVM: ListViewModel
    @State var addNewSublist = false
    
    var onCommit: (Result<ListCellModel, InputError>) -> Void = { _ in }
    
    var body: some View {
        Section {
            HStack {
                if listRowVM.title != "" {
                    Image(systemName: listRowVM.isCompleteCheck())
                        .onTapGesture {
                            self.listRowVM.isComplete.toggle()
                    }
                    .font(Font.system(size: 20))
                } else {
                    Image(systemName: "plus.circle.fill")
                        .font(Font.system(size: 20))
                        .foregroundColor(self.listVM.colorSystemImage)
                }
                
                TextField("Enter new task", text: self.$listRowVM.title, onEditingChanged: { isChange in
                    //isChange
                    self.listRowVM.isEditing = isChange
                }) {
                    //onCommit
                    if !self.listRowVM.title.isEmpty {
                        self.onCommit(.success(ListCellModel(title: self.listRowVM.title, isExpand: false, isComplete: false, subLists: [])))
                    }
                    else {
                        self.onCommit(.failure(.empty))
                    }
                }
                .font(Font.system(size: 17, weight: listRowVM.fontWeight, design: .default))
                
                if listRowVM.isEditing && !listRowVM.title.isEmpty {
                    Button(action: {
                        self.addNewSublist.toggle()
                    }, label: {
                        Image(systemName: "plus.circle")
                            .font(Font.system(size: 20))
                            .foregroundColor(.blue)
                    })
                }
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
                            ListViewCell(listRowVM: sublistRowVM, listVM: self.listVM)
                        }
                        .onDelete { indexSet in
                            self.listRowVM.removeSublistItem(atOffsets: indexSet)
                        }
                    }
                    .padding(.leading, 20)
                }
            }
            if addNewSublist {
                ListViewCell(listRowVM: ListCellViewModel.newListRow(), listVM: self.listVM) { result in
                    if case .success(let newListRow) = result {
                        self.listRowVM.addSublistRow(newList: newListRow)
                        self.addNewSublist.toggle()
                    }
                }.padding(.horizontal)
            }
           
        }
        .listRowBackground(Color("ListCellColor"))
    }
    
    enum InputError: Error {
        case empty
    }
    
}

//struct ListRowView_Previews: PreviewProvider {
//    static var previews: some View {
//        ListRowView(listRowVM: ListRowViewModel(listRow: ListOfLists[0].listRows[1]), listVM: ListOfLists[0])
//    }
//}

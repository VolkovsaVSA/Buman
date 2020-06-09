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
    @State var addNewSublist = false
    
    var onCommit: (Result<ListRowModel, InputError>) -> Void = { _ in }
    
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
                        .foregroundColor(Color(.systemRed))
                }
                
                TextField("Enter new task", text: self.$listRowVM.title, onEditingChanged: { isChange in
                    //isChange
                    self.listRowVM.isEditing = isChange
                }) {
                    //onCommit
                    if !self.listRowVM.title.isEmpty {
                        self.onCommit(.success(ListRowModel(title: self.listRowVM.title, isExpand: false, isComplete: false, subLists: [])))
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
                            ListRowView(listRowVM: sublistRowVM)
                        }
                        .onDelete { indexSet in
                            self.listRowVM.removeSublistItem(atOffsets: indexSet)
                        }
                    }
                    .padding(.leading, 20)
                }
            }
            if addNewSublist {
                ListRowView(listRowVM: ListRowViewModel.newListRow()) { result in
                    if case .success(let newListRow) = result {
                        self.listRowVM.addSublistRow(newList: newListRow)
                        self.addNewSublist.toggle()
                    }
                }.padding(.horizontal)
            }
           
        }
    }
    
    enum InputError: Error {
        case empty
    }
    
}

struct ListRowView_Previews: PreviewProvider {
    static var previews: some View {
        ListRowView(listRowVM: ListRowViewModel(listRow: ListOfLists[0].listRows[1]))
    }
}

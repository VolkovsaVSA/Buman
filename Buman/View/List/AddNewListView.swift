//
//  AddNewListView.swift
//  Buman
//
//  Created by Sergey Volkov on 15.06.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct AddNewListView: View {
    
    @EnvironmentObject var listsVM: ListsViewModel
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var colorsVM = ColorSetViewModel()
    @ObservedObject var iconsVM = IconSetViewModel()
    @State var newListTitle = ""
    var lvm: ListViewModel?
    var size = UIScreen.main.bounds.width/10
    
    fileprivate func prepareEditListVM() {
        if self.lvm != nil {
            self.iconsVM.selectImage(selectedImage: self.lvm!.systemImage)
            self.colorsVM.selectColor(selectedColor: self.lvm!.colorSystemImage)
            self.newListTitle = self.lvm!.title
        }
    }
    fileprivate func doneButtonAction() {
        if let localLvm = self.lvm {
            localLvm.title = self.newListTitle
            localLvm.systemImage = self.iconsVM.selectedIcon()
            localLvm.colorSystemImage = self.colorsVM.selectedColor()
            self.listsVM.editList(lvm: localLvm)
        } else {
            let listModel = ListModel(title: self.newListTitle, listRows: [], systemImage: self.iconsVM.selectedIcon(), colorSystemImage: self.colorsVM.selectedColor())
            self.listsVM.lists.append(ListViewModel(list: listModel))
        }
    }
    
    var body: some View {
        
        ZStack {
            //Color("TaskTabColor")
            VStack {
                HStack {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Cancel")
                    }
                    .padding()
                    Spacer()
                    Button(action: {
                        self.doneButtonAction()
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Text("Done")
                    }
                    .disabled(self.newListTitle.isEmpty)
                    .padding()
                }.onAppear {
                    self.prepareEditListVM()
                }
                IconImageView(image: iconsVM.selectedIcon(), color: colorsVM.selectedColor(), imageScale: 50)
                .shadow(radius: 12)
                    .padding(20)
                TextField("New list title", text: $newListTitle)
                    .introspectTextField(customize: { tf in
                        tf.clearButtonMode = .whileEditing
                        tf.backgroundColor = .systemGray6
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .font(Font.system(size: 26, weight: .regular, design: .default))
                    .padding(.top)
                ScrollView {
                    ColorSetView(colorsVM: colorsVM)
                    IconSetView(iconsVM: iconsVM)
                        .padding(.top)
                    Text(" ")
                        .font(Font.system(size: 30))
                }
                
            }
        }
    }
    
}

//struct AddNewListView_Previews: PreviewProvider {
//    static var previews: some View {
//        AddNewListView(listsVM: ListsViewModel())
//    }
//}

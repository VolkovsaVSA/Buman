//
//  AddNewListView.swift
//  Buman
//
//  Created by Sergey Volkov on 15.06.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct AddNewListView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @ObservedObject var colorsVM = ColorSetViewModel()
    @ObservedObject var iconsVM = IconSetViewModel()
    
    @State private var newListTitle = ""
    @State private var buttonIsDisable = true
    
    var size = UIScreen.main.bounds.width/10
    
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
                        //some action
                    }) {
                        Text("Done")
                    }
                    .disabled(self.buttonIsDisable)
                    .padding()
                }
                IconImageView(image: iconsVM.selectedIcon(), color: colorsVM.selectedColor(), imageScale: 50)
                    .padding(20)
                TextField("New list title", text: $newListTitle, onEditingChanged: { _ in
                    if self.newListTitle != "" {
                        self.buttonIsDisable = false
                    } else {
                        self.buttonIsDisable = true
                    }
                }, onCommit: {
                    
                })
                    .introspectTextField(customize: { tf in
                        tf.clearButtonMode = .whileEditing
                        tf.backgroundColor = .systemGray6
                    })
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .font(Font.system(size: 26, weight: .regular, design: .rounded))
                Divider()
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

struct AddNewListView_Previews: PreviewProvider {
    static var previews: some View {
        AddNewListView()
    }
}

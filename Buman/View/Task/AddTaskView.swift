//
//  AddTaskView.swift
//  Buman
//
//  Created by Sergey Volkov on 21.06.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI
import FirebaseFirestore
import FirebaseFirestoreSwift

struct AddTaskView: View {
    @Environment(\.presentationMode) var presentationMode
    @EnvironmentObject var tasksVM: TasksViewModel
    
    
    var body: some View {
        NavigationView {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
                .navigationBarItems(
                    leading: Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Cancel")
                    }),
                    trailing: Button(action: {
                        let tempTask = TaskModel(id: UUID().uuidString, createdTime: Timestamp(date: Date()), title: "Temp Task", text: "temptemptemptemptemp", creatorID: "123")
                        self.tasksVM.tasks.append(tempTask)
                        self.presentationMode.wrappedValue.dismiss()
                    }, label: {
                        Text("Add")
                    }))
        }
    }
    
}

struct AddTaskView_Previews: PreviewProvider {
    static var previews: some View {
        AddTaskView()
    }
}

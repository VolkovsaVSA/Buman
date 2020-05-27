//
//  ContentView.swift
//  Buman
//
//  Created by Sergey Volkov on 26.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI

struct MainView: View {
    
//    init() {
//        UINavigationBar.appearance().backgroundColor = .systemGroupedBackground
//        UINavigationBar.appearance().isOpaque = true
//    }
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Color(.systemGroupedBackground)
                    .edgesIgnoringSafeArea(.all)
                ScrollView {
                    VStack(alignment: .leading, spacing: 20) {
                        Text("Tasks")
                            .font(.system(size: 40, weight: .bold))
                        HStack(spacing: 20) {
                            TaskMenuView(title: "Today", count: 12, image: "clock.fill", color: .yellow)
                                .cornerRadius(12)
                            TaskMenuView(title: "Tomorrow", count: 6, image: "calendar", color: .blue)
                                .cornerRadius(12)
                        }
                        HStack(spacing: 20) {
                            TaskMenuView(title: "All tasks", count: 25, image: "tray.fill", color: .gray)
                                .cornerRadius(12)
                            TaskMenuView(title: "Control", count: 2, image: "flag.fill", color: .red)
                                .cornerRadius(12)
                        }
 
                        
                        Form {
                            Section(header: Text("Important tasks")) {
                                Text("123")
                                Text("123")
                                Text("123")
                            }
                        }
                        
                    }
                    .padding(20)
                    
                }
                
            }
                
            .navigationBarTitle("", displayMode: .inline)
            .navigationBarItems(trailing:
                Button(action: {
                    
                }, label: {
                    Image(systemName: "person.crop.circle.fill")
                        .font(.title)
                }))
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = .systemGroupedBackground
                //nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
            })
                
        }
        .navigationViewStyle(StackNavigationViewStyle())
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

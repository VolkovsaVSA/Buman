//
//  ContentView.swift
//  Buman
//
//  Created by Sergey Volkov on 26.05.2020.
//  Copyright © 2020 Sergei Volkov. All rights reserved.
//

import SwiftUI
import Introspect

struct MainView: View {
    
    init() {
        UIScrollView.appearance().backgroundColor = .systemGroupedBackground
        //UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.yellow]
        //UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.yellow]
        UITableViewCell.appearance().backgroundColor = UIColor(named: "TaskTabColor")
        UITableView.appearance().backgroundColor = .systemGroupedBackground
        print(UIDevice.current.name)
    }
    
    
    @ObservedObject var navTitle = NavigationTitleViewModel()
    @ObservedObject var listVM = ListsViewModel()
    //@EnvironmentObject var listVM: ListsViewModel
    
    var body: some View {
        
        NavigationView {
            
            TabView(selection: $navTitle.selectedTab) {
                ScrollView {
                    TaskView()
                }
                .tabItem {
                    Image(systemName: "tray.fill")
                        .font(.title)
                    Text("Tasks")
                }.tag(0)
                
                ListsView(listsVM: listVM)
                    .tabItem {
                        Image(systemName: "list.bullet")
                            .font(.title)
                        Text("List")
                }.tag(1)
                
            }
            .navigationBarTitle("\(navTitle.title)", displayMode: .automatic)
            .navigationBarItems(
                //                leading: Button(action: {
                //                }, label: {
                //                    Image(systemName: "person.crop.circle.fill")
                //                        .font(.title)
                //                }),
                trailing: Button(action: {
                }, label: {
                    Image(systemName: "person.crop.circle.fill")
                        .font(.title)
                }))
            
        }
        
    }
    
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

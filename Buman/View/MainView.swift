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
        UITableViewCell.appearance().backgroundColor = UIColor(named: "TaskTabColor")
        UITableView.appearance().backgroundColor = .systemGroupedBackground
        UITableView.appearance().tableFooterView = UIView()
        print(UIDevice.current.name)
    }
    
    @ObservedObject var navTitle = NavigationTitleViewModel()
    
    
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
                
                ListsView()
                    .tabItem {
                        Image(systemName: "list.bullet")
                            .font(.title)
                        Text("List")
                }.tag(1)
                
            }
            .navigationBarTitle("\(navTitle.title)", displayMode: .automatic)
            .navigationBarItems(leading: Button(action: {
                //user profile
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

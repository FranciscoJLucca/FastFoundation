//
//  ContentView.swift
//  CBL-Manager
//
//  Created by Francisco Lucca on 15/01/20.
//  Copyright © 2020 Francisco/Joao/Marina/Victor. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    init() {
        UITabBar.appearance().barTintColor = Constants.mainColor.uiColor()
        UITabBar.appearance().unselectedItemTintColor = UIColor.init(white: 1, alpha: 0.5)
        
    }
    
    var body: some View {
        TabView {
            FindProjectView(listOfProjects: Constants.$projects)
                .tabItem {
                    Image(systemName: "pencil.and.outline")
                        .font(.system(size: 23))
                    Text("New Project")
            }.tag(1)
            
            ProjectList()
                .tabItem {
                    Image(systemName: "folder")
                        .font(.system(size: 23))
                    Text("My Projects")
            }.tag(2)
            
            MyAccountView()
                .tabItem {
                    Image(systemName: "person")
                        .font(.system(size: 23))
                    Text("Profile")
            }.tag(3)
        }
        .accentColor(.white)
    }
}

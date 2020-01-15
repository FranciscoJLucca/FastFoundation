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
            FindProjectView()
                .tabItem {
                    Image(systemName: "text.justify")
                    Text("New Project")
            }
            
            ProjectList()
                .tabItem {
                    Image(systemName: "folder")
                    Text("My Projects")
            }
            
            MyAccountView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
            }
        }
        .accentColor(.white)
    }
}

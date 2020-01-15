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
        UITabBar.appearance().barTintColor = UIColor (red: 38/255, green: 133/255, blue: 151/255, alpha: 1)
        
        UITabBar.appearance().unselectedItemTintColor = UIColor.white

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
                        .foregroundColor(.white)
                    Text("Profile")
            }
        }
        .accentColor(.black)
    }
}

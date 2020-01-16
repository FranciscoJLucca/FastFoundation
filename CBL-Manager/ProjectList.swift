//
//  ProjectList.swift
//  CBL-Manager
//
//  Created by João Leão on 14/01/20.
//  Copyright © 2020 Francisco/Joao/Marina/Victor. All rights reserved.
//

import Foundation

import Foundation
import SwiftUI


struct ProjectList: View {

    
    var body: some View {
        NavigationView {
            if (Constants.projects.count == 0) {
                NoProjectsView()
            } else {
            ScrollView {
                ForEach (Constants.projects) { i in
                    NavigationLink(destination: DetailedProject(proj:i)) {
                            ItemList(name: i.name, description: i.description, members: i.members, icon: i.icon, admin:i.admin)
                        }
                    }
            }
            .navigationBarTitle("My Projects", displayMode: .inline)
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = Constants.mainColor.uiColor()
                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
            })
                .padding(20)
            }
        }
    }
}





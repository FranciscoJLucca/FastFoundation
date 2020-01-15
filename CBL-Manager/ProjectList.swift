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


struct Project: Identifiable {
    
    var id: UUID = UUID()
    var name: String
    var description: String
    var members: String
    var icon: String
    var admin: Bool
    
}

struct ProjectList: View {
    @State var projects: [Project] = [
        Project(name: "Dig This!", description: "Digging puzzle? Dig This!", members:"dig", icon:"doc.richtext", admin: true),
        Project(name: "Dig This!", description: "Digging puzzle? Dig This!", members:"dig", icon:"doc.richtext", admin: false),
        Project(name: "Dig This!", description: "Digging puzzle? Dig This!", members:"dig", icon:"doc.richtext", admin: false),
        Project(name: "Dig This!", description: "Digging puzzle? Dig This!", members:"dig", icon:"doc.richtext", admin: false),
        Project(name: "Dig This!", description: "Digging puzzle? Dig This!", members:"dig", icon:"doc.richtext", admin: true),
        
    ]
    
    
    var body: some View {
        NavigationView {
            ScrollView () {
                ForEach (projects) { i in
                    ItemList(name: i.name, description: i.description, members: i.members, icon: i.icon, admin:i.admin)
                    Divider()
                }
            }
            .navigationBarTitle("My Projects", displayMode: .inline)
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = .init(red: 38/255, green: 133/255, blue: 151/255, alpha: 1.0)
                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
            })
                .padding(20)
        }
        
    }
}




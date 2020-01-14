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
        
        
        
        ScrollView () {
            ForEach (projects) { i in
                
//                NavigationLink(destination: ) {
                ItemList(name: i.name, description: i.description, members: i.members, icon: i.icon, admin:i.admin)
                    Divider()
//                    }
//                    .buttonStyle(PlainButtonStyle())
            }
        }
        .padding(20)
        
    }
}




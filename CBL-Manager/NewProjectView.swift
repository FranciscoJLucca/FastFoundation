//
//  NewProjectView.swift
//  CBL-Manager
//
//  Created by Marina De Pazzi on 15/01/20.
//  Copyright © 2020 Francisco/Joao/Marina/Victor. All rights reserved.
//

import SwiftUI

struct NewProjectView: View {
    
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State private var projectName: String = ""
    
    @State private var description: String = ""
    
    @State private var members: String = ""
    
    var body: some View {
        Form{
            Section(header: Text("Project Name")) {
                TextField("Name your project here.", text: $projectName)
            }
            
            Section (header: Text("Description")) {
                TextField("Enter a brief description of the project here.", text: $description)
            }
            
            Section (header: Text("Members")) {
                TextField("Enter the members of this project.", text: $members)
            }
            
        }.navigationBarTitle("New Project", displayMode: .inline)
            .navigationBarItems(trailing:  Button(action: { self.presentationMode.wrappedValue.dismiss() }, label: { Text(!self.projectName.isEmpty &&  !self.description.isEmpty && !self.members.isEmpty ? "Create" : "").foregroundColor(.white) }))
            .background(NavigationConfigurator() { nc in
                nc.navigationBar.barTintColor = .init(red: 38/255, green: 133/255, blue: 151/255, alpha: 1.0)
                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
            })
    }
}

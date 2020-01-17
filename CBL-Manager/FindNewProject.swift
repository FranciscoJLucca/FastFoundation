//
//  FinProjectView.swift
//  CBL-Manager
//
//  Created by Francisco Lucca on 14/01/20.
//  Copyright © 2020 Francisco/Joao/Marina/Victor. All rights reserved.
//

import SwiftUI

struct FindProjectView: View {
    
    @State var seachText: String = ""
    
    @Binding var listOfProjects: [Project]
    
    
    private var filteredProjects: [Project] {
        
        if self.seachText.isEmpty {
            return listOfProjects
        } else {
            return listOfProjects.filter {
                $0.name.contains(self.seachText.lowercased()) ||
                    $0.members.contains(self.seachText.lowercased())
            }
        }
    }
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height:50)
                NewProjectItem(icon:"magnifyingglass.circle", name: "Find an Existing Project", description:"Search for existing projects to start lear using CBL")
                .navigationBarTitle(Text("New Project"), displayMode: .inline)
                .background(NavigationConfigurator { nc in
                    nc.navigationBar.barTintColor = .init(red: 38/255, green: 133/255, blue: 151/255, alpha: 1.0)
                    nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                })
                
                
                
                VStack {
                    SearchBarComponent(searchText: $seachText)
                    if self.seachText != "" {
                        List {
                            ForEach(filteredProjects) { project in
                                NavigationLink(destination: DetailedProject(proj: project)) {
                                    Text(project.name)
                                }
                            }
                        }
                    }
                }
                
                
                Spacer().frame(height: 70)
                
                NewProjectItem(icon:"pencil.circle", name: "Start From Scratch", description:"Create a new projects as an administrator and add members to start creating CBL enviroments")
                
                VStack {
                    Button(action:{}) {
                        NavigationLink(destination: NewProjectView()) {
                            Text("Create New Project")
                                .foregroundColor(.white)
                                .padding(.init(top: 10, leading: 30, bottom: 10, trailing: 30))
                                .background(Constants.mainColor)
                                .cornerRadius(5)
                        }
                    }
                    
                }
                Spacer()
                
            }
            
        }
        
        
    }
}

struct NewProjectItem: View {
    var icon:String
    var name:String
    var description:String
    
    var body: some View {
        VStack {
            Image(systemName: icon)
                .resizable()
                .frame(width: 60, height: 60, alignment: .center)
                .foregroundColor(Constants.mainColor)
            
            Text(name)
                .bold()
                .font(.title)
                .foregroundColor(Constants.mainColor)
            
        
                Text(description)
                 .multilineTextAlignment(.center)
                .foregroundColor(.gray)
                    .padding(20)
        }
    }
}


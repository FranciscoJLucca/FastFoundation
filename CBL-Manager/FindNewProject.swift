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
                Spacer()
                    .frame(height: 30)
                
                Image(systemName: "magnifyingglass.circle")
                    .resizable()
                    .frame(width: 45, height: 45, alignment: .center)
                    .foregroundColor(Constants.mainColor)
                    .navigationBarTitle(Text("Find Project"), displayMode: .inline)
                    .background(NavigationConfigurator { nc in
                        nc.navigationBar.barTintColor = .init(red: 38/255, green: 133/255, blue: 151/255, alpha: 1.0)
                        nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                    })
                
                
                Text("Find an Existing Project")
                    .bold()
                    .font(.system(size: 25))
                    .frame(width: nil, height: nil, alignment: .center)
                    .foregroundColor(Constants.mainColor)
                
                Spacer()
                    .frame(height: 5)
                
                Text("Search for existing projects to start lear using CBL")
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
                    .frame(width: nil, height: nil, alignment: .center)
                
                Spacer()
                    .frame(height: 5)
                
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
                
                Spacer()
                    .frame(height: 50)
                
                VStack {
                    Image(systemName: "pencil.circle")
                        .resizable()
                        .frame(width: 45, height: 45, alignment: .center)
                        .foregroundColor(Constants.mainColor)

                    Text("Start From Scratch")
                        .bold()
                        .frame(width: nil, height: nil, alignment: .center)
                        .font(.system(size: 25))
                        .foregroundColor(Constants.mainColor)

                    Text("Create a new projects as an administrator and add members to start creating CBL enviroments")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                        .frame(width: nil, height: nil, alignment: .center)

                    Spacer()
                        .frame(height: 10)

                    Button(action: {
                    }) {
                        NavigationLink(destination: MyAccountView()) {
                            Text("Create New Project")
                                .foregroundColor(.white)
                        }
                    }
                    .padding(.init(top: 7, leading: 25, bottom: 7, trailing: 25))
                    .background(Constants.mainColor)
                    .cornerRadius(5)
                }
                
                Spacer()
                
                
            }
            .padding(.top, 60)
        }
    }
}


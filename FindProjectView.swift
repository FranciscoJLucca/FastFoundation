//
//  FinProjectView.swift
//  CBL-Manager
//
//  Created by Francisco Lucca on 14/01/20.
//  Copyright © 2020 Francisco/Joao/Marina/Victor. All rights reserved.
//

import SwiftUI

struct FindProjectView: View {
    var body: some View {
        NavigationView {
            VStack {
                
                Spacer()
                    .frame(height: 30)
                
                Image(systemName: "magnifyingglass.circle")
                    .resizable()
                    .frame(width: 45, height: 45, alignment: .center)
                    .foregroundColor(.blue)
                    .navigationBarTitle(Text("Find Project"), displayMode: .inline)
                
                Text("Find an Existing Project")
                    .bold()
                    .font(.system(size: 25))
                    .frame(width: nil, height: nil, alignment: .center)
                    .foregroundColor(.blue)
                
                Spacer()
                    .frame(height: 5)
                
                Text("Search for existing projects to start lear using CBL")
                    .foregroundColor(.gray)
                    .font(.system(size: 12))
                    .frame(width: nil, height: nil, alignment: .center)
                
                Spacer()
                    .frame(height: 5)
                
                SearchBarComponent()
                
                Spacer()
                    .frame(height: 50)
                
                VStack {
                    Image(systemName: "pencil.circle")
                        .resizable()
                        .frame(width: 45, height: 45, alignment: .center)
                        .foregroundColor(.blue)
                    
                    Text("Start From Scratch")
                        .bold()
                        .frame(width: nil, height: nil, alignment: .center)
                        .font(.system(size: 25))
                        .foregroundColor(.blue)
                    
                    Text("Create a new project as an administrator and add members to start creating CBL enviroments")
                        .multilineTextAlignment(.center)
                        .foregroundColor(.gray)
                        .font(.system(size: 12))
                        .frame(width: nil, height: nil, alignment: .center)
                    
                    Spacer()
                        .frame(height: 10)
                    
                    Button(action: {print(Text("asas"))}) {
                        Text("Create New Project")
                            .foregroundColor(.white)
                    }
                    .padding(.init(top: 7, leading: 25, bottom: 7, trailing: 25))
                    .background(Color(.blue))
                    .cornerRadius(5)
                }
                
                Spacer()
                
                
            }
            .padding(.top, 60)
        }
    }
}



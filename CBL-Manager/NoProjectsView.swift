//
//  NoProjectsView.swift
//  CBL-Manager
//
//  Created by Francisco Lucca on 15/01/20.
//  Copyright © 2020 Francisco/Joao/Marina/Victor. All rights reserved.
//

import SwiftUI

struct NoProjectsView: View {
    var body: some View {
            VStack {
                HStack {
                    Image(systemName: "pencil.circle")
                        .resizable()
                        .frame(width: 60, height: 60, alignment: .center)
                        .foregroundColor(Constants.mainColor)
                    
                    Image(systemName: "magnifyingglass.circle")
                        .resizable()
                        .frame(width: 60, height: 60, alignment: .center)
                        .foregroundColor(Constants.mainColor)
                }
                
                Text("You Have no Projects")
                    .bold()
                    .frame(width: nil, height: nil, alignment: .center)
                    .font(.system(size: 25))
                    .foregroundColor(Constants.mainColor)
                
                Text("Search for projects or create new ones in the 'New Project' section")
                    .multilineTextAlignment(.center)
                    .foregroundColor(.gray)
                    .font(.system(size: 15))
                    .frame(width: nil, height: nil, alignment: .center)
                
            }
            .padding(10)
            .navigationBarTitle("My Projects", displayMode: .inline)
            .background(NavigationConfigurator { nc in
                nc.navigationBar.barTintColor = .init(red: 38/255, green: 133/255, blue: 151/255, alpha: 1.0)
                nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
            })
    }
}


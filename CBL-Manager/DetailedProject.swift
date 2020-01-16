//
//  DetailedProject.swift
//  CBL-Manager
//
//  Created by João Leão on 15/01/20.
//  Copyright © 2020 Francisco/Joao/Marina/Victor. All rights reserved.
//

import Foundation
import SwiftUI

struct DetailedProject: View {
    var proj:Project

    var body: some View {
        VStack {
            
            Image(systemName: proj.icon)
                .resizable()
                .foregroundColor(Constants.mainColor)
                .scaledToFit()
                .frame(height:100)
                .padding(Edge.Set.trailing, 10)
            
            Text(proj.name)
                .foregroundColor(Constants.mainColor)
                .bold()
                .font(.system(size: 40))
            
            Spacer().frame(height: 30)
            
            VStack {
                item(name: "Creator", data:proj.creator)
                item(name: "Description", data:proj.description)
                item(name: "Members", data:proj.members)
            }
            
            Spacer().frame(height: 30)
            
            VStack{
                modal(name: "Engage", icon:"bubble.left.and.bubble.right", proj: self.proj)
                modal(name: "Investigate", icon:"magnifyingglass",proj: self.proj)
                modal(name: "Act", icon:"hammer",proj: self.proj)
            }
            
            
            Spacer()
            
        }
        .navigationBarTitle("", displayMode: .inline)
        .background(NavigationConfigurator { nc in
            nc.navigationBar.barTintColor = Constants.mainColor.uiColor()
            nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
        })
            .padding(20)
        
    }
}


struct modal: View {
    var name: String
    var icon: String
    var proj: Project
    @State private var showModal = false
    var body: some View {
        Button(action: {self.showModal.toggle()}) {
            HStack{
                Spacer().frame(width:70)
                Image(systemName: icon)
                    .resizable()
                    .foregroundColor(Constants.mainColor)
                    .scaledToFit()
                    .frame(height:30)
                Spacer().frame(width:20)
                Text(name)
                    .font(.system(size: 25))
                    .bold()
                Spacer()
            }
            .frame(width: 350, height: 70)
            .foregroundColor(Constants.mainColor)
            .background(Color.white)
            .clipped()
            .cornerRadius(30)
            .shadow(color: Constants.secondColor, radius: 4, x: 0, y: 4)
            
        }
        .sheet(isPresented: $showModal) {
            ProjectStep(proj:self.proj,name: self.name, showModal:self.$showModal)
        }
    }
}



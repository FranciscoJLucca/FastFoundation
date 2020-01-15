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
    @State private var showModal = false
    var body: some View {
        VStack{
            
            HStack {
                Image(systemName: proj.icon)
                    .resizable()
                    .foregroundColor(Constants.mainColor)
                    .scaledToFit()
                    .frame(height:100)
                    .padding(Edge.Set.trailing, 10)
                
                
                VStack {
                    
                    HStack{
                        Text(proj.name)
                            .foregroundColor(Constants.mainColor)
                            .bold()
                            .font(.system(size: 40))
                        //.minimumScaleFactor(0.5)
                        
                        
                        Spacer()
                    }
                    HStack {
                        Text("Creator ")
                            .foregroundColor(Constants.mainColor)
                            .bold()
                            + Text(proj.creator)
                                .foregroundColor(Constants.secondColor)
                        Spacer()
                    }
                    
                }
            }
            .frame(height: nil)
            
            
            VStack {
                HStack {
                    Text("Description ")
                        .foregroundColor(Constants.mainColor)
                        .bold()
                        + Text(proj.description)
                            .foregroundColor(Constants.secondColor)
                    Spacer()
                }
                Spacer().frame(height: 10)
                HStack {
                    Text("Members ")
                        .foregroundColor(Constants.mainColor)
                        .bold()
                        + Text(proj.members)
                            .foregroundColor(Constants.secondColor)
                    Spacer()
                }
            }
            Spacer().frame(height: 30)
            
            Button("Engage") {
               self.showModal.toggle()
            }.sheet(isPresented: $showModal) {
                ProjectStep(proj:self.proj, showModal: self.$showModal)
             }
            
            
        }
        .navigationBarTitle(proj.name)
        .navigationBarHidden(true)
        .padding(20)
        
        
        
    }
}


//
//  Item List.swift
//  CBL-Manager
//
//  Created by João Leão on 14/01/20.
//  Copyright © 2020 Francisco/Joao/Marina/Victor. All rights reserved.

import SwiftUI
import Foundation

struct ItemList: View {
    var name:String
    var description:String
    var members:String
    var icon:String
    var admin:Bool
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .resizable()
                .foregroundColor(Constants.mainColor)
                .scaledToFit()
                .frame(height:100)
                .padding(Edge.Set.trailing, 10)
            
            
            VStack {
                
                HStack{
                    Text(name)
                        .foregroundColor(Constants.mainColor)
                        .font(.title)
                        .bold()
                    
//                    if admin {
//                        Image(systemName: "person.crop.circle.badge.checkmark")
//                            .resizable()
//                            .foregroundColor(Constants.mainColor)
//                            .scaledToFit()
//                            .frame(height:30)
//                            .padding(Edge.Set.trailing, 10)
//                    }
                    
                    Spacer()
                }
                Spacer()
                
                HStack {
                    Text("Description")
                        .foregroundColor(Constants.mainColor)
                        .bold()
                    Text(description)
                        .foregroundColor(Constants.secondColor)
                    Spacer()
                }
                Spacer()
                HStack {
                    Text("Members")
                        .foregroundColor(Constants.mainColor)
                        .bold()
                    Text(members)
                        .foregroundColor(Constants.secondColor)
                    Spacer()
                }
            }
            
            Image(systemName: "chevron.right")
                .resizable()
                .scaledToFit()
                .frame(height:20)
                .foregroundColor(Constants.secondColor)
            
            
        }
        .frame(height: 100)
        
        
        
    }
}


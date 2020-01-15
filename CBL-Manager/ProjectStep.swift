//
//  DetailedProject.swift
//  CBL-Manager
//
//  Created by João Leão on 15/01/20.
//  Copyright © 2020 Francisco/Joao/Marina/Victor. All rights reserved.
//

import Foundation
import SwiftUI

struct ProjectStep: View {

    var proj:Project
    
    @Binding var showModal: Bool
    
    var body: some View {
        VStack {
            Spacer().frame(height: 30)
            Text("Engage")
                .bold()
                .foregroundColor(Constants.mainColor)
                .font(.title)
            VStack {
                
                HStack {
                    Text("Big Idea ")
                        .foregroundColor(Constants.mainColor)
                        .bold()
                    Spacer()
                }
                HStack {
                    Text(proj.engage.bigIdea)
                        .foregroundColor(Constants.secondColor)
                    Spacer()
                }
                
                Spacer().frame(height: 10)
                
                HStack {
                    Text("Essential Question ")
                        .foregroundColor(Constants.mainColor)
                        .bold()
                    Spacer()
                }
                HStack {
                    Text(proj.engage.essentialQuestion)
                        .foregroundColor(Constants.secondColor)
                    Spacer()
                }
                
                
                Spacer().frame(height: 10)
                HStack {
                    Text("Challenge ")
                        .foregroundColor(Constants.mainColor)
                        .bold()
                    Spacer()
                }
                HStack {
                    Text(proj.engage.challenge)
                        .foregroundColor(Constants.secondColor)
                    Spacer()
                }
                
                Spacer().frame(height: 10)
                
                VStack {
                    HStack {
                        Text("Annotations ")
                            .foregroundColor(Constants.mainColor)
                            .bold()
                        Spacer()
                    }
                    
                    HStack {
                        if proj.engage.annotations.count==0 {
                            Text("No annotations")
                                .foregroundColor(Constants.secondColor)
                        }else {
                            Text(proj.engage.annotations)
                                .foregroundColor(Constants.secondColor)
                        }
                        Spacer()
                    }
                }
            }
            .padding(30)
            
            Spacer()
        }
    }
    
}


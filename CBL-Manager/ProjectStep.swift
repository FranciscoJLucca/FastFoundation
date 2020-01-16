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
    var name:String
    @Binding var showModal: Bool
    @State private var showingAlert = false
    @State private var editing = false
    var body: some View {
        
        VStack {
            HStack{
                Spacer()
                if editing {
                Button (action: {self.showModal.toggle()}) {
                    Text("Done")
                        .underline()
                        .foregroundColor(Constants.mainColor)
                        .font(.system(size: 20))
                    }
                }else {
                    Button (action: {self.editing.toggle()}) {
                    Text("Edit")
                        .underline()
                        .foregroundColor(Constants.mainColor)
                        .font(.system(size: 20))
                    }

                }
                Spacer().frame(width:20)
            }
            Spacer().frame(height: 10)
            Text(name)
                .bold()
                .foregroundColor(Constants.mainColor)
                .font(.title)
            Spacer().frame(height: 20)
            
            
            if editing {
                
                if name=="Engage"{
                    itemEditable(name:"Big Idea", data:proj.engage.bigIdea)
                    itemEditable(name:"Essential Question", data:proj.engage.essentialQuestion)
                    itemEditable(name:"Challenge", data:proj.engage.challenge)
                    itemEditable(name:"Annotations", data:proj.engage.annotations)
                    
                } else if name=="Investigate"{
                    multipleItemEditable(name:"Guiding Questions", data:proj.investigate.guidingQuestions)
                    multipleItemEditable(name:"Activities", data:proj.investigate.activities)
                    multipleItemEditable(name:"Resources", data:proj.investigate.resources)
                    itemEditable(name:"Annotations", data:proj.investigate.annotations)
                } else {
                    
                    itemEditable(name:"Annotations", data:proj.act.annotations)
                    Spacer().frame(height: 30)
                    
                    Button (action: {
                        self.showingAlert = true

                    }) {
                        VStack {
                            Image(systemName:"square.and.arrow.up")
                                .resizable()
                                .foregroundColor(Constants.mainColor)
                                .scaledToFit()
                                .frame(height:100)
                                .padding(Edge.Set.trailing, 10)
                            Spacer().frame(height: 10)
                            Text("Upload your files for evaluation")
                                .foregroundColor(Constants.mainColor)
                        }
                    }
                    .alert(isPresented: $showingAlert) {
                        Alert(title: Text("Files Uploaded"), message: Text("Your files have been successfully uploaded"), dismissButton: .default(Text("Ok")))
                    }
                }
                
            } else {
            
            if name=="Engage"{
                item(name:"Big Idea", data:proj.engage.bigIdea)
                item(name:"Essential Question", data:proj.engage.essentialQuestion)
                item(name:"Challenge", data:proj.engage.challenge)
                item(name:"Annotations", data:proj.engage.annotations)
                
            } else if name=="Investigate"{
                multipleItem(name:"Guiding Questions", data:proj.investigate.guidingQuestions)
                multipleItem(name:"Activities", data:proj.investigate.activities)
                multipleItem(name:"Resources", data:proj.investigate.resources)
                item(name:"Annotations", data:proj.investigate.annotations)
            } else {
                
                item(name:"Annotations", data:proj.act.annotations)
                Spacer().frame(height: 30)
                
                Button (action: {
                    self.showingAlert = true

                }) {
                    VStack {
                        Image(systemName:"square.and.arrow.up")
                            .resizable()
                            .foregroundColor(Constants.mainColor)
                            .scaledToFit()
                            .frame(height:100)
                            .padding(Edge.Set.trailing, 10)
                        Spacer().frame(height: 10)
                        Text("Upload your files for evaluation")
                            .foregroundColor(Constants.mainColor)
                    }
                }
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Files Uploaded"), message: Text("Your files have been successfully uploaded"), dismissButton: .default(Text("Ok")))
                }
            }
            }
            
            
            Spacer()
        }
        .padding(30)
        
        
    }
    
}

struct item: View {
    var name:String
    var data: String
    
    var body: some View {
        VStack {
            HStack {
                Text(name)
                    .foregroundColor(Constants.mainColor)
                    .bold()
                Spacer()
            }
            Spacer().frame(height: 10)
            if data.count==0 {
                HStack {
                    Text("You have not filled this section")
                        .foregroundColor(Constants.secondColor)
                    Spacer()
                }
            } else {
            HStack {
                Text(data)
                    .foregroundColor(Constants.secondColor)
                Spacer()
            }
            }
            
            Spacer().frame(height: 20)
        }
        
    }
}


struct itemEditable: View {
    var name:String
    @State var data: String
    var body: some View {
        VStack {
            HStack {
                Text(name)
                    .foregroundColor(Constants.mainColor)
                    .bold()
                Spacer()
            }
            Spacer().frame(height: 10)
            
            HStack {
                TextField(data, text: $data)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                Spacer()
            }
            
            Spacer().frame(height: 20)
        }
        
    }
}



struct multipleItem: View {
    var name:String
    var data: [String]
    
    var body: some View {
        VStack {
            HStack {
                Text(name)
                    .foregroundColor(Constants.mainColor)
                    .bold()
                Spacer()
            }
            if data.count==0 {
                Spacer().frame(height: 10)
                HStack {
                    Text("You have not filled this section")
                        .foregroundColor(Constants.secondColor)
                    Spacer()
                }
            } else {
            VStack {
                ForEach (self.data, id: \.self) { i in
                    
                    VStack {
                        Spacer().frame(height: 10)
                        HStack {
                        Text(i)
                        .foregroundColor(Constants.secondColor)
                        Spacer()
                    }
                    }
                    
                }
            }
            }
            
            Spacer().frame(height: 20)
        }
        
    }
}


struct multipleItemEditable: View {
    var name:String
    var data: [String]
    @State var textField=""
    
    var body: some View {
        VStack {
            HStack {
                Text(name)
                    .foregroundColor(Constants.mainColor)
                    .bold()
                Spacer()
            }
            if data.count==0 {
                Spacer().frame(height: 10)
                HStack {
                    Text("You have not filled this section")
                        .foregroundColor(Constants.secondColor)
                    Spacer()
                }
            } else {
            VStack {
                ForEach (self.data, id: \.self) { i in
                    
                    VStack {
                        Spacer().frame(height: 10)
                        HStack {
                            TextField(i, text: self.$textField)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                            Spacer()
                        }
                    }
                    
                }
            }
            }
            
            Spacer().frame(height: 20)
        }
        
    }
}

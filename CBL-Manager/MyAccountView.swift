//
//  MyAccountView.swift
//  CBL-Manager
//
//  Created by Marina De Pazzi on 14/01/20.
//  Copyright © 2020 Francisco/Joao/Marina/Victor. All rights reserved.
//

import SwiftUI

//for navigation bar color change
struct NavigationConfigurator: UIViewControllerRepresentable {
    var configure: (UINavigationController) -> Void = { _ in }
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<NavigationConfigurator>) -> UIViewController {
        UIViewController()
    }
    func updateUIViewController(_ uiViewController: UIViewController, context: UIViewControllerRepresentableContext<NavigationConfigurator>) {
        if let nc = uiViewController.navigationController {
            self.configure(nc)
        }
    }
    
}

struct MyAccountView: View {
    
    //color of the app
    var appColor = Color(red: 38/255, green: 133/255, blue: 151/255)
    
    var body: some View {
        NavigationView{
            VStack (spacing: 10){
                //navigation bar title and color display
                Text("")
                    .navigationBarTitle("My Account", displayMode: .inline)
                    .background(NavigationConfigurator { nc in
                        nc.navigationBar.barTintColor = .init(red: 38/255, green: 133/255, blue: 151/255, alpha: 1.0)
                        nc.navigationBar.titleTextAttributes = [.foregroundColor : UIColor.white]
                    })
                    .navigationBarItems(trailing:
                        EditButton.init().foregroundColor(.white)
                )
                
                //avatar icon
                Image(systemName: "person.circle")
                    .resizable()
                    .frame(width: 115, height: 115, alignment: .center)
                    .foregroundColor(appColor)
                
                //avatar text
                Text("Change Avatar")
                    .bold()
                    .font(.system(size: 13))
                    .frame(width: 107, height: 26, alignment: .center)
                    .foregroundColor(.white)
                    .background(appColor)
                    .cornerRadius(9)
                
                
                Spacer().frame(height: 5)
                Divider()
                                
                //text fields and personal info
                VStack (spacing: 3){
                    HStack {
                        Text("Name: ")
                            .bold()
                            .foregroundColor(appColor)
                            .frame(width: 100, height: 30, alignment: .leading)
                        
                        Text("Marina De Pazzi")
                            .bold()
                            .foregroundColor(.black)
                            .frame(width: 200, height: 30, alignment: .leading)
                        
                    }
                    
                    HStack{
                        Text("E-mail: ")
                            .bold()
                            .foregroundColor(appColor)
                            .frame(width: 100, height: 30, alignment: .leading)
                        
                        
                        Text("mariidepazzi@gmail.com")
                            .bold()
                            .foregroundColor(.black)
                            .frame(width: 200, height: 30, alignment: .leading)
                        
                    }
                    
                    HStack{
                        Text("User Name: ")
                            .bold()
                            .foregroundColor(appColor)
                            .frame(width: 100, height: 30, alignment: .leading)
                        
                        Text("MarinaDePazzi")
                            .bold()
                            .foregroundColor(.black)
                            .frame(width: 200, height: 30, alignment: .leading)
                    }
                    
                    HStack{
                        Text("Password: ")
                            .bold()
                            .foregroundColor(appColor)
                            .frame(width: 100, height: 30, alignment: .leading)
                        
                        
                        Text("***************")
                            .bold()
                            .foregroundColor(.black)
                            .frame(width: 200, height: 30, alignment: .leading)
                        
                    }
                }
                
                Spacer()
                
                Text("Sign Out").foregroundColor(.red).underline()
                
            }.padding(20)
        }
    }
}

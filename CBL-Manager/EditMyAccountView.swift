//
//  EditMyAccountView.swift
//  CBL-Manager
//
//  Created by Marina De Pazzi on 16/01/20.
//  Copyright © 2020 Francisco/Joao/Marina/Victor. All rights reserved.
//

import SwiftUI

struct EditMyAccountView: View {
    
    @State private var name: String = ""
    
    @State private var email: String = ""
    
    @State private var username: String = ""
    
    @State private var password: String = ""

    
    var body: some View {
        Form{
            Section(header: Text("Name")) {
                TextField("Enter your Name.", text: $name)
            }
            
            Section (header: Text("E-mail")) {
                TextField("Enter you e-mail here.", text: $email)
            }
            
            Section (header: Text("Username")) {
                TextField("Enter your username here", text: $username)
            }
            
            Section (header: Text("Password")) {
                TextField("Enter your new password here.", text: $password)
            }
        }
        
    }
}

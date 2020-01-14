//
//  SearchBarComponent.swift
//  CBL-Manager
//
//  Created by Francisco Lucca on 14/01/20.
//  Copyright © 2020 Francisco/Joao/Marina/Victor. All rights reserved.
//

import SwiftUI

struct SearchBarComponent: View {
    
    @State var searchText = ""
    
    var body: some View {
        TextField("Search for members, projecrs or labels", text: $searchText)
        .textFieldStyle(RoundedBorderTextFieldStyle())
            .frame(width: 350, height: 20, alignment: .center)
            .padding(20)
    }
}

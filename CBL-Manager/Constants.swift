//
//  colors.swift
//  CBL-Manager
//
//  Created by João Leão on 14/01/20.
//  Copyright © 2020 Francisco/Joao/Marina/Victor. All rights reserved.
//

import Foundation
import SwiftUI

class Constants {

    static let mainColor = Color(red: 38/255, green: 133/255, blue: 151/255)
    static let secondColor = Color(red: 163/255, green: 163/255, blue: 163/255)
    
    @State static var projects: [Project] = [
        Project(name: "CBL Manager",
                description: "Project to develop a way to better understand why companies do not use CBL",
                members:"João, Marina, Francisco, Victor",
                icon:"doc.richtext",
                admin: true,
                creator:"joaofleao",
                engage: Engage(bigIdea:"Education",
                               essentialQuestion:"Why is CBL not used in business enviroments.",
                               challenge:"How to potentialize CBL use on business enviroments.",
                               annotations:""),
                investigate: Investigate(guidingQuestions:["Por que as empresas já não utilizam o CBL?", "Qual método em questão que as empresas utilizam para gestão do conhecimento?", "As empresas têm conhecimento e sabem o que é o CBL?", "As empresas estão abertas para utilização de CBL?"],
                                         resources:[""],
                                         activities:[""],
                                         annotations:""),
                act:Act(annotations:"")
        )
    ]

}




struct Project: Identifiable {
    
    var id: UUID = UUID()
    var name: String
    var description: String
    var members: String
    var icon: String
    var admin: Bool
    var creator:String
    var engage: Engage
    var investigate: Investigate
    var act: Act
}

struct Engage: Identifiable {
    var id: UUID = UUID()
    var bigIdea: String
    var essentialQuestion: String
    var challenge: String
    var annotations: String

}

struct Investigate: Identifiable {
    var id: UUID = UUID()
    var guidingQuestions: [String]
    var resources: [String]
    var activities: [String]
    var annotations: String
}

struct Act: Identifiable {
    var id: UUID = UUID()
    var annotations: String
}


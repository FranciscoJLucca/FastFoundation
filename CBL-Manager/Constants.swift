//
//  colors.swift
//  CBL-Manager
//
//  Created by João Leão on 14/01/20.
//  Copyright © 2020 Francisco/Joao/Marina/Victor. All rights reserved.
//

import Foundation
import SwiftUI

extension Color {

    func uiColor() -> UIColor {

        let components = self.components()
        return UIColor(red: components.r, green: components.g, blue: components.b, alpha: components.a)
    }

    private func components() -> (r: CGFloat, g: CGFloat, b: CGFloat, a: CGFloat) {

        let scanner = Scanner(string: self.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
        var hexNumber: UInt64 = 0
        var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0

        let result = scanner.scanHexInt64(&hexNumber)
        if result {
            r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
            g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
            b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
            a = CGFloat(hexNumber & 0x000000ff) / 255
        }
        return (r, g, b, a)
    }
}
class Constants {

    static let mainColor = Color(red: 38/255, green: 133/255, blue: 151/255)
    static let secondColor = Color(red: 163/255, green: 163/255, blue: 163/255)
    
    @State static var mainUser = User(name: "Marina de Pazzi", email: "mariidepazzi@gmail.com", username: "MarinaDePazzi", password: "**********")
    
    @State static var projects: [Project] = [
        Project(name: "CBL Manager",
                description: "Project to develop a way to better understand why companies do not use CBL",
                members:"João, Marina, Francisco, Victor",
                icon:"doc.text",
                admin: true,
                creator:"joaofleao",
                engage: Engage(bigIdea:"Education",
                               essentialQuestion:"Why is CBL not used in business enviroments.",
                               challenge:"How to potentialize CBL use on business enviroments.",
                               annotations:""),
                investigate: Investigate(guidingQuestions:["Por que as empresas já não utilizam o CBL?", "Qual método em questão que as empresas utilizam para gestão do conhecimento?", "As empresas têm conhecimento e sabem o que é o CBL?", "As empresas estão abertas para utilização de CBL?"],
                                         resources:["Google", "Friends", "Company Owners"],
                                         activities:["Research on google and other platforms", "Talk to friends, family members and classmates", "Understand the complexity of changing the learning methods in companies"],
                                         annotations:""),
                act:Act(annotations:"")
        ),
        Project(name: "Project Manager",
                description: "Manage your programs",
                members:"joaofleao, francisco",
                icon:"doc.text",
                admin: true,
                creator:"MarinaDePazzi",
                engage: Engage(bigIdea:"",
                               essentialQuestion:"",
                               challenge:"",
                               annotations:""),
                investigate: Investigate(guidingQuestions:[],
                                         resources:[],
                                         activities:[],
                                         annotations:""),
                act:Act(annotations:"")
        )
    ]

}



struct User: Identifiable {
    
    var id: UUID = UUID()
    var name: String
    var email: String
    var username: String
    var password: String

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


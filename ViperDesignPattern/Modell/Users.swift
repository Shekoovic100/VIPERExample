//
//  Users.swift
//  ViperDesignPattern
//
//  Created by sherif on 16/12/2024.
//

import Foundation


struct Users: Codable {
    let id: Int?
    let name: String?
    let username: String?
    let email: String?
}


struct UserViewModel {
    
    var name: String
    var email: String
    var userName: String
    init(user: Users){
        name = user.name ?? ""
        userName = user.username ?? ""
        email = user.email ?? ""
    }
    
    
}

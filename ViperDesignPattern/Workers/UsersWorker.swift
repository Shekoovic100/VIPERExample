//
//  UsersWorker.swift
//  ViperDesignPattern
//
//  Created by sherif on 15/12/2024.
//

import Foundation


class UsersWorker {
    
    let netwrokService = NetworkService()
    
    func getUsers(completion: @escaping ([Users]?,Error?) -> Void) {
        netwrokService.request(urlString: Constants.usersEndPoint, method: .get, completion: completion)
    }
}

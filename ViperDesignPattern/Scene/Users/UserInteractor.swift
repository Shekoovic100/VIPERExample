//
//  UserInteractor.swift
//  ViperDesignPattern
//
//  Created by sherif on 15/12/2024.
//

import Foundation


class UserInteractor: UserInteractorInputProtocol {
  
    weak var presenter: UserInteractorOutputProtocol?
    private let userWorker = UsersWorker()
    
    func fetchData() {
        userWorker.getUsers { [weak self] users, error in
            if let users = users {
                self?.presenter?.usesrFetchedSuccessfully(user: users)
            }else if let error = error{
                self?.presenter?.errorInFetching(withError: error)
            }
        }
    }
    
    
}

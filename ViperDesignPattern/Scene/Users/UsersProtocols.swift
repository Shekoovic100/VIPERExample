//
//  UsersProtocols.swift
//  ViperDesignPattern
//
//  Created by sherif on 15/12/2024.
//

import Foundation

protocol UserViewProtocol: AnyObject {
    var presenter: UserPresenterProtocol? {get set}
    func showIndictor()
    func hideIndictor()
    func reloadNewData()
}

protocol UserPresenterProtocol: AnyObject {
    var view: UserViewProtocol? {get set}
    func viewData()
    var numberOfRows: Int {get}
    func configureCell(cell: UserCellView, indexPath: IndexPath)
}

protocol UsersRouterProtocol {
    
}


protocol UserInteractorInputProtocol {   // Come from presenter to order interactor to make call api for example 
    var presenter: UserInteractorOutputProtocol? {get set}
    func fetchData()
}

// when interactor make some operation and get outpout to presenter
protocol UserInteractorOutputProtocol: AnyObject {
    func usesrFetchedSuccessfully(user: [Users])
    func errorInFetching(withError: Error)
}

protocol UserCellView{
    func configureCell(viewModel: UserViewModel)
}

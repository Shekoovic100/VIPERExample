//
//  UserPresenter.swift
//  ViperDesignPattern
//
//  Created by sherif on 15/12/2024.
//

import Foundation


class UserPresenter: UserPresenterProtocol ,UserInteractorOutputProtocol {
 
    
    weak var view: UserViewProtocol?
    private let interactor: UserInteractorInputProtocol?
    private let router: UsersRouterProtocol?
    var usersList = [Users]()
    var numberOfRows: Int {
        return usersList.count
    }
    init(view: UserViewProtocol?, interactor: UserInteractorInputProtocol?, router: UsersRouterProtocol?) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewData() {
        view?.showIndictor()
        interactor?.fetchData()
    }
    
    
    func usesrFetchedSuccessfully(user: [Users]) {
        view?.hideIndictor()
        usersList.append(contentsOf: user)
        view?.reloadNewData()
    }
    
    func errorInFetching(withError: Error) {
        view?.hideIndictor()
    }
    
    func configureCell(cell: UserCellView, indexPath: IndexPath) {
        let user = usersList[indexPath.row]
        let viewModel = UserViewModel(user: user)
         cell.configureCell(viewModel: viewModel)
    }
    
    
}

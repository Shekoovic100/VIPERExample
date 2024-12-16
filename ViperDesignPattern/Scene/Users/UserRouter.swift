//
//  UserRouter.swift
//  ViperDesignPattern
//
//  Created by sherif on 15/12/2024.
//

import UIKit


class UserRouter: UsersRouterProtocol {
    
    weak var viewController: UIViewController?
    
    static func createModule() -> UIViewController {
        let view = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "\(UsersViewController.self)") as! UsersViewController
        let router =  UserRouter()
        let interactor = UserInteractor()
        let presenter = UserPresenter(view: view, interactor: interactor, router: router)
        view.presenter = presenter
        interactor.presenter = presenter
        router.viewController = view
        return view
    }
    
}

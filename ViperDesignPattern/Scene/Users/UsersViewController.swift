//
//  ViewController.swift
//  ViperDesignPattern
//
//  Created by sherif on 15/12/2024.
//

import UIKit

class UsersViewController: UIViewController, UserViewProtocol {

    @IBOutlet weak var usersTableView: UITableView!
    
    var presenter: UserPresenterProtocol?
    

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewData()
    }
    
    func showIndictor() {
        print("Is Showing Indicator")
    }
    
    func hideIndictor() {
        print("Is Showing Indicator")
    }
    
    func reloadNewData() {
        DispatchQueue.main.async {
            self.usersTableView.reloadData()
        }
    }
}


extension UsersViewController: UITableViewDelegate , UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.numberOfRows ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell  = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as!  UesrsCell
        presenter?.configureCell(cell: cell, indexPath: indexPath)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
}


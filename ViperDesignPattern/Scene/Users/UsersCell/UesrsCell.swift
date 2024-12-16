//
//  UesrsCell.swift
//  ViperDesignPattern
//
//  Created by sherif on 15/12/2024.
//

import UIKit

class UesrsCell: UITableViewCell, UserCellView {


    @IBOutlet weak var userAddress: UILabel!
    @IBOutlet weak var userName: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    
    func configureCell(viewModel: UserViewModel) {
        userAddress.text = viewModel.name
        userName.text = viewModel.userName
    }
    
}

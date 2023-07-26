//
//  ItemNameTextFieldCell.swift
//  MuMu-Project
//
//  Created by Phongsakorn Srikate on 7/7/2566 BE.
//

import UIKit

class ItemNameTextFieldCell: UITableViewCell {
    @IBOutlet weak var firstNameTextfield: UITextField!
    @IBOutlet weak var lastNameTextfield: UITextField!
    override func awakeFromNib() {
        super.awakeFromNib()
        firstNameTextfield.layer.borderColor = UIColor(red: 206/255, green: 206/255, blue: 206/255, alpha: 1).cgColor
        lastNameTextfield.layer.borderColor = UIColor(red: 206/255, green: 206/255, blue: 206/255, alpha: 1).cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

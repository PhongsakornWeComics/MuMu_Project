//
//  ItemSelectionCell.swift
//  MuMu-Project
//
//  Created by Phongsakorn Srikate on 6/7/2566 BE.
//

import UIKit

class ItemSelectionCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var markLabel: UILabel!
    @IBOutlet weak var borderView: UIView!
    @IBOutlet weak var nameLabel: UILabel!
    
    @IBOutlet weak var leftImageView: UIImageView!
    @IBOutlet weak var rightImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        borderView.layer.cornerRadius = 6
        borderView.layer.borderColor = UIColor(red: 206/255, green: 206/255, blue: 206/255, alpha: 1).cgColor
        borderView.layer.borderWidth = 1.0
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

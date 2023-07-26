//
//  ItemTitleLocationDetailCell.swift
//  MuMu-Project
//
//  Created by Phongsakorn Srikate on 7/6/2566 BE.
//

import UIKit

class ItemTitleLocationDetailCell: UITableViewCell {
    @IBOutlet weak var iconMapImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var titleDetailLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

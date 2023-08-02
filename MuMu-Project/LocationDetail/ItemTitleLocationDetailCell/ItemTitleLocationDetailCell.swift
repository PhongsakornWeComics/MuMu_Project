//
//  ItemTitleLocationDetailCell.swift
//  MuMu-Project
//
//  Created by Phongsakorn Srikate on 7/6/2566 BE.
//

import UIKit

class ItemTitleLocationDetailCell: UITableViewCell {
    @IBOutlet weak var bgView: UIView! {
        didSet {
            bgView.layer.cornerRadius = 22.0
        }
    }
    @IBOutlet weak var imageViewBg: UIView! {
        didSet {
            imageViewBg.layer.cornerRadius = 9.0
        }
    }
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subTitleLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    @IBOutlet weak var phoneNumberLabel: UILabel!
    @IBOutlet weak var mapLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

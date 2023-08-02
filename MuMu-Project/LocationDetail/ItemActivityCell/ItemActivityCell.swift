//
//  ItemActivityCell.swift
//  MuMu-Project
//
//  Created by Phongsakorn Srikate on 2/8/2566 BE.
//

import UIKit

class ItemActivityCell: UICollectionViewCell {

    @IBOutlet weak var bgView: UIView! {
        didSet {
            bgView.layer.cornerRadius = 17.0
        }
    }
    
    @IBOutlet weak var detailLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

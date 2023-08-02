//
//  ItemImageLocationCell.swift
//  MuMu-Project
//
//  Created by Phongsakorn Srikate on 2/8/2566 BE.
//

import UIKit

class ItemImageLocationCell: UICollectionViewCell {

    @IBOutlet weak var titleImageView: UIImageView! {
        didSet {
            titleImageView.layer.cornerRadius = 10
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}

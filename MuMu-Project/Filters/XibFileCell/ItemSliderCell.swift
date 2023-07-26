//
//  ItemSliderCell.swift
//  MuMu-Project
//
//  Created by Phongsakorn Srikate on 6/7/2566 BE.
//

import UIKit

protocol ItemSliderCellAlertDelegate {
    func ItemSliderDidUpdate(value: Int)
}

class ItemSliderCell: UITableViewCell {

    @IBOutlet weak var radiusLabel: UILabel!
    var delegate: ItemSliderCellAlertDelegate!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @IBAction func slider(_ sender: UISlider) {
        self.delegate.ItemSliderDidUpdate(value: Int(sender.value))
    }
    
}

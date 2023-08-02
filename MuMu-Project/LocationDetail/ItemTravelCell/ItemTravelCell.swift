//
//  ItemTravelCell.swift
//  MuMu-Project
//
//  Created by Phongsakorn Srikate on 2/8/2566 BE.
//

import UIKit

class ItemTravelCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var travelCV: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        travelCV.delegate = self
        travelCV.dataSource = self
        
        registerNibFile()
    }
    
    private func registerNibFile() {
        travelCV.register(UINib(nibName: "ItemTravelDetailCVCell", bundle: nil), forCellWithReuseIdentifier: "ItemTravelDetailCVCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"ItemTravelDetailCVCell", for: indexPath) as! ItemTravelDetailCVCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 271, height: 128)
        return size
    }
    
}

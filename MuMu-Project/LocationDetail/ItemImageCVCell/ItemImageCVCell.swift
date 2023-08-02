//
//  ItemImageCVCell.swift
//  MuMu-Project
//
//  Created by Phongsakorn Srikate on 2/8/2566 BE.
//

import UIKit

class ItemImageCVCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout  {

    @IBOutlet weak var imageCV: UICollectionView!
    override func awakeFromNib() {
        super.awakeFromNib()
        imageCV.delegate = self
        imageCV.dataSource = self
        
        registerNibFile()
    }
    
    private func registerNibFile() {
        imageCV.register(UINib(nibName: "ItemImageLocationCell", bundle: nil), forCellWithReuseIdentifier: "ItemImageLocationCell")
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"ItemImageLocationCell", for: indexPath) as! ItemImageLocationCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 200, height: 267)
        return size
    }
    
}

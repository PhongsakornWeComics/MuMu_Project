//
//  ItemDetailActivityCell.swift
//  MuMu-Project
//
//  Created by Phongsakorn Srikate on 2/8/2566 BE.
//

import UIKit

class ItemDetailActivityCell: UITableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout   {
    
    @IBOutlet weak var activityCV: UICollectionView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
      
        activityCV.delegate = self
        activityCV.dataSource = self
        
        registerNibFile()
    }
    
    private func registerNibFile() {
        activityCV.register(UINib(nibName: "ItemActivityCell", bundle: nil), forCellWithReuseIdentifier: "ItemActivityCell")
    }
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:"ItemActivityCell", for: indexPath) as! ItemActivityCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = CGSize(width: 320, height: 183)
        return size
    }
    
}

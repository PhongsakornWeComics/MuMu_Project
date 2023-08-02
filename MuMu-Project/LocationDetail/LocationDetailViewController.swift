//
//  LocationDetailViewController.swift
//  MuMu-Project
//
//  Created by Phongsakorn Srikate on 4/6/2566 BE.
//

import UIKit
import GoogleMaps
import CoreLocation

class LocationDetailViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var bgView: UIView! {
        didSet {
           bgView.layer.cornerRadius = 30.0
        }
    }
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.layer.cornerRadius = 30.0
        }
    }
    
    @IBOutlet weak var barView: UIView! {
        didSet {
            barView.layer.cornerRadius = 6.0
            barView.layer.masksToBounds = true
        }
    }
    
    var myLocationLatitude: Double!
    var myLcationLongitude: Double!
    var placeLocationLatitude: Double!
    var placeLcationLongitude: Double!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibFile()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    private func registerNibFile() {
        tableView.register(UINib(nibName: "ItemTitleLocationDetailCell", bundle: nil), forCellReuseIdentifier: "ItemTitleLocationDetailCell")
        tableView.register(UINib(nibName: "ItemTitleSectionCell", bundle: nil), forCellReuseIdentifier: "ItemTitleSectionCell")
        tableView.register(UINib(nibName: "ItemDetailActivityCell", bundle: nil), forCellReuseIdentifier: "ItemDetailActivityCell")
        tableView.register(UINib(nibName: "ItemTravelCell", bundle: nil), forCellReuseIdentifier: "ItemTravelCell")
        tableView.register(UINib(nibName: "ItemLabelDatailCell", bundle: nil), forCellReuseIdentifier: "ItemLabelDatailCell")
        tableView.register(UINib(nibName: "ItemImageCVCell", bundle: nil), forCellReuseIdentifier: "ItemImageCVCell")
    }
    
    @objc func imageTapped(tapGestureRecognizer: UITapGestureRecognizer) {
        if self.myLcationLongitude != nil && self.myLcationLongitude != nil && self.placeLocationLatitude != nil && self.placeLcationLongitude != nil {
            let urlString = "comgooglemaps://?saddr=\(self.myLocationLatitude!),\(self.myLcationLongitude!)&daddr=\(self.placeLocationLatitude!),\(self.placeLcationLongitude!)&directionsmode=driving"
            if let url = URL(string: urlString) {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                } else {
                    // Handle if Google Maps app is not installed
                    // You can fallback to other maps or provide an alert
                }
            }
        }
    }

    @IBAction func selectedClose() {
        self.dismiss(animated: true)
    }
    
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else if section == 2 || section == 3 || section == 4  {
            return 2
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTitleLocationDetailCell", for: indexPath) as! ItemTitleLocationDetailCell
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            cell.mapLabel.isUserInteractionEnabled = true
            cell.mapLabel.addGestureRecognizer(tapGestureRecognizer)
            return cell
        } else  if indexPath.section == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemImageCVCell", for: indexPath) as! ItemImageCVCell
                return cell
        } else  if indexPath.section == 2 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTitleSectionCell", for: indexPath) as! ItemTitleSectionCell
                cell.titleLabel.text = "กิจกรรม"
                cell.subTitleLabel.text = "ทั้งหมด 4 รายการ"
                cell.titleImageView.image = UIImage(named: "ic_puzzle_pieces")
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemDetailActivityCell", for: indexPath) as! ItemDetailActivityCell
                return cell
            }
        } else  if indexPath.section == 3 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTitleSectionCell", for: indexPath) as! ItemTitleSectionCell
                cell.titleLabel.text = "การเดินทาง"
                cell.subTitleLabel.text = "ทั้งหมด 4 รายการ"
                cell.titleImageView.image = UIImage(named: "ic_travel")
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTravelCell", for: indexPath) as! ItemTravelCell
                return cell
            }
        } else  if indexPath.section == 4 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTitleSectionCell", for: indexPath) as! ItemTitleSectionCell
                cell.titleLabel.text = "การเตรียมตัว"
                cell.subTitleLabel.isHidden = true
                cell.titleImageView.image = UIImage(named: "ic_preparation")
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemLabelDatailCell", for: indexPath) as! ItemLabelDatailCell
                return cell
            }
        } else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTitleSectionCell", for: indexPath) as! ItemTitleSectionCell
            return cell
        }
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 2 || indexPath.section == 3 || indexPath.section == 4 {
            if indexPath.row == 0 {
                return 50
            } else {
                return UITableView.automaticDimension
            }
        } else {
            return UITableView.automaticDimension
        }
    }
}

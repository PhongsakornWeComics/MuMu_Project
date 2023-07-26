//
//  LocationDetailViewController.swift
//  MuMu-Project
//
//  Created by Phongsakorn Srikate on 4/6/2566 BE.
//

import UIKit
import GoogleMaps
import CoreLocation

class LocationDetailViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var bgView: UIView! {
        didSet {
           bgView.layer.cornerRadius = 10.0
        }
    }
    
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.layer.cornerRadius = 10.0
        }
    }
    
    @IBOutlet weak var imageHeaderCollectionView: UICollectionView!
    
    var myLocationLatitude: Double!
    var myLcationLongitude: Double!
    var placeLocationLatitude: Double!
    var placeLcationLongitude: Double!
    
    @IBOutlet weak var pageControl: UIPageControl!
    var timer = Timer()
    var counter = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        registerNibFile()
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.imageHeaderCollectionView.delegate = self
        self.imageHeaderCollectionView.dataSource = self
        
        pageControl.currentPage = 0
        timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(changeImage), userInfo: nil, repeats: true)
        
        pageControl.numberOfPages = 3
        imageHeaderCollectionView.reloadData()
    }
    
//    var banners: [Banner]! {
//        didSet {
//            pageControl.numberOfPages = banners.count
//            imageHeaderCollectionView.reloadData()
//        }
//    }

    @objc func changeImage(){
        let imageCount = 3
        if imageCount == 0 { return }
        if counter < imageCount {
           // let index = .init(item: counter, section: 0)
            self.imageHeaderCollectionView.scrollToItem(at: IndexPath(row: counter, section: 0), at: .centeredHorizontally, animated: true)
            pageControl.currentPage = counter
            counter += 1
        } else {
            counter = 0
          //  let index = IndexPath.init(item: counter, section: 0)
            self.imageHeaderCollectionView.scrollToItem(at: IndexPath(row: counter, section: 0), at: .centeredHorizontally, animated: true)
            pageControl.currentPage = counter
        }
    }
    
    private func registerNibFile() {
        tableView.register(UINib(nibName: "ItemTitleLocationDetailCell", bundle: nil), forCellReuseIdentifier: "ItemTitleLocationDetailCell")
        tableView.register(UINib(nibName: "ItemLabelTitleCell", bundle: nil), forCellReuseIdentifier: "ItemLabelTitleCell")
        tableView.register(UINib(nibName: "ItemLabelDatailCell", bundle: nil), forCellReuseIdentifier: "ItemLabelDatailCell")
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
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "imageHeaderCell", for: indexPath) as! ImageHeaderCollectionViewCell
        return cell
    }
    
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        return CGSize(width: 50, height: 50)
//    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 1
        } else if section == 1 {
            return 3
        } else if section == 2 {
            return 3
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTitleLocationDetailCell", for: indexPath) as! ItemTitleLocationDetailCell
            let tapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(imageTapped(tapGestureRecognizer:)))
            cell.iconMapImageView.isUserInteractionEnabled = true
            cell.iconMapImageView.addGestureRecognizer(tapGestureRecognizer)
            return cell
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemLabelTitleCell", for: indexPath) as! ItemLabelTitleCell
                cell.titleLabel.text = "การเดินทาง:"
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemLabelDatailCell", for: indexPath) as! ItemLabelDatailCell
                cell.detailLabel.text = "- เดินทางโดย BTS นั่งbtsจากสถานีใดก็ได้มาลงตรงศาลาแดง จากนั้นออกทางออกสองเพื่อมาต่อรถเมลล์สาย 15 77 หรือ76 ไปก็ได้คะ บอกเขาลงวัดแขก ถ้าร้อนแนะนำนั่ง76เป็นรถแอร์ค่ะ"
                return cell
            } else if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemLabelDatailCell", for: indexPath) as! ItemLabelDatailCell
                cell.detailLabel.text = "- จากหน้า Centralworld นั่ง77จากฝั่ง บิ๊กซีค่ะ นั่ง76 ที่เขียนป้ายว่าไปอู่แสมดำ ไม่ใช่ประตูน้ำนะคะ วิธีนี้เหมาะสำหรับคนที่ไปไหว้พระตรีมูราติ มาแล้วอยากไปวัดแขกต่อเลย"
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemLabelDatailCell", for: indexPath) as! ItemLabelDatailCell
                return cell
            }
        } else if indexPath.section == 2 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemLabelTitleCell", for: indexPath) as! ItemLabelTitleCell
                cell.titleLabel.text = "การเตรียมตัว:"
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemLabelDatailCell", for: indexPath) as! ItemLabelDatailCell
                cell.detailLabel.text = "- ห้ามนำเนื้อสัตว์ทุกชนิด เข้าไปในบริเวณโบสถ์ สามารถถวายได้เฉพาะ นม ผลไม้ ดอกไม้ และขนมอินเดียเท่านั้น ห้ามผู้หญิงที่กำลังมีประจำเดือน เข้าไปในบริเวณโบสถ์ ผู้ที่มาไหว้วัดแขก"
                return cell
            } else if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemLabelDatailCell", for: indexPath) as! ItemLabelDatailCell
                cell.detailLabel.text = "- สิ่งสำคัญเลยคือ ควรแต่งกายสุภาพ ผู้หญิงไม่สวมกระโปรงสั้น กางเกงขาสั้น เสื้อแขนกุด สายเดี่ยวต่างๆ "
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemLabelDatailCell", for: indexPath) as! ItemLabelDatailCell
                return cell
            }
        }else {
            let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTitleLocationDetailCell", for: indexPath) as! ItemTitleLocationDetailCell
            return cell
        }
    }

}

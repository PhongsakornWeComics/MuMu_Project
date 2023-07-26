//
//  FilterViewController.swift
//  MuMu-Project
//
//  Created by Phongsakorn Srikate on 11/6/2566 BE.
//

import UIKit

class FilterViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var mainView: UIView! {
        didSet {
            mainView.layer.cornerRadius = 6
        }
    }
    
    @IBOutlet weak var barView: UIView! {
        didSet {
            barView.layer.cornerRadius = 6
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var filterButton: UIButton! {
        didSet {
            filterButton.layer.cornerRadius = 6
        }
    }
    
    var isOpenFilterSpecial = false
    var valueRadius = 5
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        registerNibFile()
    }
    
    private func registerNibFile() {
        tableView.register(UINib(nibName: "ItemSelectionCell", bundle: nil), forCellReuseIdentifier: "ItemSelectionCell")
        tableView.register(UINib(nibName: "ItemSliderCell", bundle: nil), forCellReuseIdentifier: "ItemSliderCell")
        tableView.register(UINib(nibName: "ItemTitleLabelCell", bundle: nil), forCellReuseIdentifier: "ItemTitleLabelCell")
        tableView.register(UINib(nibName: "ItemNameTextFieldCell", bundle: nil), forCellReuseIdentifier: "ItemNameTextFieldCell")
        tableView.register(UINib(nibName: "ItemSectionCell", bundle: nil), forCellReuseIdentifier: "ItemSectionCell")
        tableView.register(UINib(nibName: "ItemBirthDayCell", bundle: nil), forCellReuseIdentifier: "ItemBirthDayCell")
        tableView.register(UINib(nibName: "ItemRememberCell", bundle: nil), forCellReuseIdentifier: "ItemRememberCell")
        tableView.register(UINib(nibName: "ItemMoreCell", bundle: nil), forCellReuseIdentifier: "ItemMoreCell")
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return 5
        } else {
            if self.isOpenFilterSpecial {
                return 6
            } else {
                return 3
            }
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemSelectionCell", for: indexPath) as! ItemSelectionCell
                cell.titleLabel.text = "หัวข้อ"
                cell.nameLabel.text = "การงาน - การเงิน"
                cell.leftImageView.image = UIImage(named: "ic_category")
                cell.rightImageView.image = UIImage(named: "ic_dropdown")
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemSelectionCell", for: indexPath) as! ItemSelectionCell
                cell.titleLabel.text = "ปัญหา"
                cell.nameLabel.text = "ติดหนี้"
                cell.leftImageView.image = UIImage(named: "ic_category")
                cell.rightImageView.image = UIImage(named: "ic_dropdown")
                return cell
            } else if indexPath.row == 2 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemSelectionCell", for: indexPath) as! ItemSelectionCell
                cell.titleLabel.text = "ประเภทสถานที่"
                cell.nameLabel.text = "วัดไทย"
                cell.leftImageView.image = UIImage(named: "ic_category")
                cell.rightImageView.image = UIImage(named: "ic_dropdown")
                return cell
            } else if indexPath.row == 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemSelectionCell", for: indexPath) as! ItemSelectionCell
                cell.titleLabel.text = "ที่ตั้ง"
                cell.nameLabel.text = "ที่อยู่ปัจจุบันของฉัน"
                cell.leftImageView.image = UIImage(named: "ic_pin")
                cell.rightImageView.image = UIImage(named: "ic_search")
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemSliderCell", for: indexPath) as! ItemSliderCell
                cell.delegate = self
                cell.radiusLabel.text = "รัศมี \(self.valueRadius) กิโลเมตร"
                return cell
            }
        }
        else {
            if indexPath.row == 0 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemSectionCell", for: indexPath) as! ItemSectionCell
                return cell
            } else if indexPath.row == 1 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemTitleLabelCell", for: indexPath) as! ItemTitleLabelCell
                return cell
            } else if indexPath.row == 2 {
                if self.isOpenFilterSpecial {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ItemNameTextFieldCell", for: indexPath) as! ItemNameTextFieldCell
                    return cell
                } else {
                    let cell = tableView.dequeueReusableCell(withIdentifier: "ItemMoreCell", for: indexPath) as! ItemMoreCell
                    cell.titleLabel.text = "แสดง"
                    cell.arrowImageView.image = UIImage(named: "ic_dropdown")
                    return cell
                }
            } else if indexPath.row == 3 {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemBirthDayCell", for: indexPath) as! ItemBirthDayCell
                return cell
            } else if indexPath.row == 4  {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemRememberCell", for: indexPath) as! ItemRememberCell
                return cell
            } else {
                let cell = tableView.dequeueReusableCell(withIdentifier: "ItemMoreCell", for: indexPath) as! ItemMoreCell
                cell.titleLabel.text = "ซ่อน"
                cell.arrowImageView.image = UIImage(named: "ic_arrow_hidden")
                return cell
            }
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.section == 1 && indexPath.row == 0 {
            return 5
        } else if indexPath.section == 1 && indexPath.row == 4 {
            return 50
        }
        else {
            return UITableView.automaticDimension
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if (indexPath.section == 1 && indexPath.row == 2) || (indexPath.section == 1 && indexPath.row == 5) {
            self.isOpenFilterSpecial = !self.isOpenFilterSpecial
            self.tableView.reloadData()
        }
    }
}

extension FilterViewController: ItemSliderCellAlertDelegate {
    func ItemSliderDidUpdate(value: Int) {
        self.valueRadius = value
        tableView.reloadData()
    }
    
    
}

//
//  HospitalInfoViewController.swift
//  RisingTest
//
//  Created by 안다영 on 2022/08/10.
//

import UIKit

class HospitalInfoViewController: UIViewController {
    
    @IBOutlet weak var streetNameAddr: UILabel!
    @IBOutlet weak var hours: UILabel!
    
    @IBOutlet weak var monTime: UILabel!
    @IBOutlet weak var tueTime: UILabel!
    @IBOutlet weak var wedTime: UILabel!
    @IBOutlet weak var thuTime: UILabel!
    @IBOutlet weak var friTime: UILabel!
    @IBOutlet weak var satTime: UILabel!
    @IBOutlet weak var sunTime: UILabel!
    @IBOutlet weak var holidayTime: UILabel!
    
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var bus: UILabel!
    
    @IBOutlet weak var mainConerView: UIView!
    @IBOutlet weak var topConerView: UIView!
    @IBOutlet weak var bottomCornerView: UIView!
    
    
    
    func getDayOfWeek(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        formatter.locale = Locale(identifier:"ko_KR")
        let convertStr = formatter.string(from: date)
        return convertStr
    }
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let calcToday = Date()
        let todayKO = getDayOfWeek(date: calcToday)
        
        print("‼️HospitalInfoViewController‼️")
        
        mainConerView.layer.cornerRadius = 10
        bottomCornerView.layer.cornerRadius = 10
        bottomCornerView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        topConerView.layer.cornerRadius = 10
        topConerView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMaxYCorner, .layerMaxXMaxYCorner)
        
        streetNameAddr.text = "\(Constant.detailInfo?.streetNmAddr ?? "")에 위치한 \(Constant.detailInfo?.institKind ?? "")"
        hours.text = "\(todayKO) \(Constant.detailInfo?.wednesday ?? "")"
        monTime.text = Constant.detailInfo?.monday
        tueTime.text = Constant.detailInfo?.tuesday
        wedTime.text = Constant.detailInfo?.wednesday
        thuTime.text = Constant.detailInfo?.thursday
        friTime.text = Constant.detailInfo?.friday
        satTime.text = Constant.detailInfo?.saturday
        sunTime.text = Constant.detailInfo?.sunday
        holidayTime.text = Constant.detailInfo?.holiday
        self.location.text = Constant.detailInfo?.streetNmAddr
        self.bus.text = Constant.detailInfo?.organLOC
    }
}

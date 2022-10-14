//
//  InfoViewController.swift
//  RisingTest
//
//  Created by 안다영 on 2022/08/10.
//

import UIKit


class MainInfoViewController: UIViewController {
    
    var index = 0
    var item : [Item] = []
    
    @IBOutlet weak var cornerView: UIView!
    
    @IBOutlet weak var infoLabel: UILabel!
    @IBOutlet weak var institKind: UILabel!
    @IBOutlet weak var Establishment: UILabel!
    @IBOutlet weak var institNM: UILabel!
    @IBOutlet weak var examPart: UILabel!
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        tabBarController?.tabBar.isHidden = false
        self.navigationController?.popViewController(animated: true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("‼️MainInfoViewController‼️")
        
        setView()
    }
    
    func setView(){
        cornerView.clipsToBounds = true
        cornerView.layer.cornerRadius = 10
        cornerView.layer.maskedCorners = CACornerMask(arrayLiteral: .layerMinXMinYCorner, .layerMaxXMinYCorner)
        
        infoLabel.text = item[index].institNm
        institKind.text = item[index].institKind
        
        let date = Date()
        let formmater = DateFormatter()
        formmater.dateFormat = "yyyy년 M월 dd일"
        var today = formmater.string(from: date)
        today = String(Array(today)[0...3])
        print("‼️today : \(today)")
        let establishYear = Int(String(Array(item[index].registDt)[0...3]))
        print("‼️establishYear : \(establishYear!)")
        let result = abs(establishYear! - Int(today)!) + 1
        Establishment.text = "설립 \(result)년"
        
        institNM.text = item[index].institNm
        examPart.text = item[index].examPart
    }

}

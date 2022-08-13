//
//  TabViewController.swift
//  RisingTest
//
//  Created by 안다영 on 2022/08/10.
//

import UIKit
import Tabman
import Pageboy

class TabViewController: TabmanViewController {
    
    private var viewControllers: Array<UIViewController> = []
    
    //@IBOutlet weak var tmpView: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HospitalInfoViewController") as! HospitalInfoViewController
        let vc2 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MedicalInfoViewController") as! MedicalInfoViewController
        let vc3 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "DoctorInfoViewController") as! DoctorInfoViewController
        let vc4 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "FacilityInfoViewController") as! FacilityInfoViewController
        let vc5 = UIStoryboard.init(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "NearbyPharmViewController") as! NearbyPharmViewController
        
        viewControllers.append(vc1)
        viewControllers.append(vc2)
        viewControllers.append(vc3)
        viewControllers.append(vc4)
        viewControllers.append(vc5)
        
        self.dataSource = self
        
        
        let bar = TMBar.ButtonBar()
        settingTabBar(ctBar: bar) //함수 추후 구현
        addBar(bar, dataSource: self, at: .top)
    }
    
    func settingTabBar (ctBar : TMBar.ButtonBar) {
        
        // 왼쪽 여백주기
        ctBar.layout.contentInset = UIEdgeInsets(top: 15.0, left: 20.0, bottom: 0.0, right: 20.0)
        
        ctBar.backgroundView.style = .blur(style: .regular)
        
        
        ctBar.indicator.weight = .light
        ctBar.indicator.tintColor = UIColor(named: "기본텍스트컬러")
        
        ctBar.buttons.customize { (button) in
            button.tintColor = .systemGray3
            button.selectedTintColor = UIColor(named: "기본텍스트컬러")
        }
        
        ctBar.indicator.overscrollBehavior = .compress
        ctBar.layout.transitionStyle = .snap
    }
    
}
extension TabViewController: PageboyViewControllerDataSource, TMBarDataSource {
    
    func barItem(for bar: TMBar, at index: Int) -> TMBarItemable {
        
        // MARK: -Tab 안 글씨들
        switch index {
        case 0:
            return TMBarItem(title: "병원 정보")
        case 1:
            return TMBarItem(title: "진료 정보")
        case 2:
            return TMBarItem(title: "의사 정보")
        case 3:
            return TMBarItem(title: "시설 정보")
        case 4:
            return TMBarItem(title: "근처 약국")
        default:
            let title = "Page \(index)"
            return TMBarItem(title: title)
        }
        
    }
    
    func numberOfViewControllers(in pageboyViewController: PageboyViewController) -> Int {
        //위에서 선언한 vc array의 count를 반환합니다.
        return viewControllers.count
    }
    
    func viewController(for pageboyViewController: PageboyViewController,
                        at index: PageboyViewController.PageIndex) -> UIViewController? {
        return viewControllers[index]
    }
    
    func defaultPage(for pageboyViewController: PageboyViewController) -> PageboyViewController.Page? {
        return nil
    }
}

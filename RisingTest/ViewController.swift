//
//  ViewController.swift
//  RisingTest
//
//  Created by 안다영 on 2022/08/08.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var mainLabel: UILabel!
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var searchView: UIView!
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var calendarView: UIView!
    
    @IBOutlet weak var bannerCollectionView: UICollectionView!
    
    
    @IBAction func tapSearchButton(_ sender: UIButton) {
        SearchHospitalDataManager().getHomeVCResult(delegate: self)
    }
    
    
    // 현재페이지 체크 변수 (자동 스크롤할 때 필요)
    var nowPage: Int = 0
    
    // 데이터 배열
    let dataArray: Array<UIImage> = [UIImage(named: "배너1")!, UIImage(named: "배너2")!]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dismissKeyboardWhenTappedAround()
        setView()
    }
    
    func setView(){
        mainLabel.text = "어떤 병원을\n 찾고 계시나요?"
        
        searchTF.addLeftPadding(width: 15)
        searchTF.addRightPadding(width: 50)
        searchTF.borderStyle = .none
        searchTF.layer.masksToBounds = false
        searchTF.layer.cornerRadius = 15
        
        searchView.layer.masksToBounds = false
        searchView.layer.cornerRadius = 15
        searchView.layer.shadowOpacity = 0.2
        searchView.layer.shadowRadius = 2
        searchView.layer.shadowOffset = CGSize(width: 1, height: 1)
        searchView.layer.shadowColor = UIColor.black.cgColor
        
        locationView.layer.masksToBounds = false
        locationView.layer.cornerRadius = 10
        locationView.layer.borderWidth = 0.5
        locationView.layer.borderColor = UIColor.systemGray5.cgColor
        
        calendarView.layer.masksToBounds = false
        calendarView.layer.cornerRadius = 10
        calendarView.layer.borderWidth = 0.5
        calendarView.layer.borderColor = UIColor.systemGray5.cgColor
        
        bannerCollectionView.delegate = self
        bannerCollectionView.dataSource = self
        bannerTimer()
        bannerMove()
    }
    
    func bannerTimer() {
        let _: Timer = Timer.scheduledTimer(withTimeInterval: 3, repeats: true) { (Timer) in
            self.bannerMove()
        }
    }
    // 배너 움직이는 매서드
    func bannerMove() {
        // 현재페이지가 마지막 페이지일 경우
        if nowPage == dataArray.count-1 {
            // 맨 처음 페이지로 돌아감
            bannerCollectionView.scrollToItem(at: NSIndexPath(item: 0, section: 0) as IndexPath, at: .right, animated: true)
            nowPage = 0
            return
        }
        // 다음 페이지로 전환
        nowPage += 1
        bannerCollectionView.scrollToItem(at: NSIndexPath(item: nowPage, section: 0) as IndexPath, at: .right, animated: true)
    }
    
    
}
extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    //컬렉션뷰 개수 설정
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    //컬렉션뷰 셀 설정
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = bannerCollectionView.dequeueReusableCell(withReuseIdentifier: "BannerCell", for: indexPath) as! BannerCell
        cell.imgView.image = dataArray[indexPath.row]
        cell.imgView.layer.cornerRadius = 15
        return cell
    }
    
    // UICollectionViewDelegateFlowLayout 상속
    //컬렉션뷰 사이즈 설정
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: bannerCollectionView.frame.size.width, height:  bannerCollectionView.frame.height)
    }
    
    //컬렉션뷰 감속 끝났을 때 현재 페이지 체크
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        nowPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
    }
    
}

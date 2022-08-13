//
//  SearchViewController.swift
//  RisingTest
//
//  Created by 안다영 on 2022/08/09.
//

import UIKit

class SearchViewController: UIViewController {
    
    var receiveSearch = ""
    var item : [Item] = []
    var day = ""
    
    @IBOutlet weak var searchTF: UITextField!
    @IBOutlet weak var locationView: UIView!
    @IBOutlet weak var calendarView: UIView!
    @IBOutlet weak var settingsView: UIView!
    @IBOutlet weak var searchCount: UILabel!
    @IBOutlet weak var searchResultTableView: UITableView!
    
    
    @IBAction func tapBackButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    @IBAction func tapSearchButton(_ sender: Any) {
        item.removeAll()
        SearchHospitalDataManager().getSearchVCResult(delegate: self)
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setView()
    }
    
    func setView(){
        searchTF.text = receiveSearch
        searchTF.borderStyle = .none
        searchTF.clearButtonMode = .always
        
        locationView.layer.masksToBounds = false
        locationView.layer.cornerRadius = 10
        locationView.layer.borderWidth = 0.5
        locationView.layer.borderColor = UIColor.systemGray5.cgColor
        
        calendarView.layer.masksToBounds = false
        calendarView.layer.cornerRadius = 10
        calendarView.layer.borderWidth = 0.5
        calendarView.layer.borderColor = UIColor.systemGray5.cgColor
        
        settingsView.layer.masksToBounds = false
        settingsView.layer.cornerRadius = 10
        settingsView.layer.borderWidth = 0.5
        settingsView.layer.borderColor = UIColor.systemGray5.cgColor
        
        searchCount.text = "총 \(item.count)개"
        
        setTableView()
    }
    
    func setTableView(){
        let searchResultCell = UINib(nibName: "searchHospitalTableViewCell", bundle: nil)
        searchResultTableView.register(searchResultCell, forCellReuseIdentifier: "searchHospitalTableViewCell")
        searchResultTableView.delegate = self
        searchResultTableView.dataSource = self
        searchResultTableView.separatorStyle = .none
        searchResultTableView.estimatedRowHeight = 100
        searchResultTableView.rowHeight = UITableView.automaticDimension
    }
    
    func setCell(cell: searchHospitalTableViewCell, indexPath: IndexPath){
        cell.selectionStyle = .none
        cell.hospitalName.text = item[indexPath.row].institNm
        
        let calcToday = Date()
        let todayKO = getDayOfWeek(date: calcToday)
        day = todayKO
        
        cell.time.text = "\(todayKO) \(item[indexPath.row].tuesday)"
        
        cell.kind.text = "ㅣ \(item[indexPath.row].institKind)"
        
        cell.address.text = item[indexPath.row].streetNmAddr
        
    }
    
    func getDayOfWeek(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        formatter.locale = Locale(identifier:"ko_KR")
        let convertStr = formatter.string(from: date)
        return convertStr
    }
    
    func getDayOfWeek2(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "EEEE"
        formatter.locale = Locale(identifier:"default")
        let convertStr = formatter.string(from: date)
        return convertStr
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return item.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = searchResultTableView.dequeueReusableCell(withIdentifier: "searchHospitalTableViewCell", for: indexPath) as! searchHospitalTableViewCell
        setCell(cell: cell, indexPath: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("‼️click‼️ : \(item[indexPath.row])")
        guard let vc = self.storyboard?.instantiateViewController(identifier: "MainInfoViewController") as? MainInfoViewController else { return }
        Constant.detailInfo = item[indexPath.row]
        vc.item = item
        vc.index = indexPath.row
        
        self.tabBarController?.tabBar.isHidden = true
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}

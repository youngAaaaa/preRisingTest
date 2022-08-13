//
//  SearchHospitalDataManager.swift
//  RisingTest
//
//  Created by 안다영 on 2022/08/09.
//

import Foundation
import Alamofire

final class SearchHospitalDataManager {
    
    func getHomeVCResult(delegate: ViewController) {
        
        let url = Constant.requestUrl
        let encodedURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let param: Parameters = [
            "serviceKey" : Constant.serviceKey.utf8,
            "pageNo" : 1,
            "numOfRows" : 10,
            "resultType" : "json",
            "instit_nm" : delegate.searchTF.text!.utf8
        ]
        
        AF.request(encodedURL!,
                   method: .get,
                   parameters: param
        ).responseDecodable(of: SearchHospitalResponse.self) { response in
            switch response.result {
            case .success(let response) :
                print("‼️ \(response.medicalInstitInfo.body.items.item)")
                guard let vc = delegate.storyboard?.instantiateViewController(identifier: "SearchViewController") as? SearchViewController else { return }
                vc.item = response.medicalInstitInfo.body.items.item
                vc.receiveSearch = delegate.searchTF.text!
                delegate.navigationController?.pushViewController(vc, animated: true)
                
            case .failure(let error):
                do{
                    let result = try JSONDecoder().decode(SearchHospitalResponse.self, from: response.data!)
                    print("실패 result : \(result)")
                    
                } catch let DecodingError.dataCorrupted(context) {
                    print(context)
                } catch let DecodingError.keyNotFound(key, context) {
                    print("Key '\(key)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.valueNotFound(value, context) {
                    print("Value '\(value)' not found:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch let DecodingError.typeMismatch(type, context)  {
                    print("Type '\(type)' mismatch:", context.debugDescription)
                    print("codingPath:", context.codingPath)
                } catch {
                    print("error: ", error)
                }
                
                print(error.localizedDescription)
            }
        }
    }
    
    
    func getSearchVCResult(delegate: SearchViewController) {
        let url = Constant.requestUrl
        let encodedURL = url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let param: Parameters = [
            "serviceKey" : Constant.serviceKey.utf8,
            "pageNo" : 1,
            "numOfRows" : 15,
            "resultType" : "json",
            "instit_kind" : delegate.searchTF.text!.utf8
        ]
        
        AF.request(encodedURL!,
                   method: .get,
                   parameters: param
        )
        .responseDecodable(of: SearchHospitalResponse.self) { response in
            switch response.result {
            case .success(let response) :
                print("‼️ \(response.medicalInstitInfo.body.items.item)")
                delegate.item = response.medicalInstitInfo.body.items.item
                let count = String(response.medicalInstitInfo.body.items.item.count)
                delegate.searchCount.text = "총 \(count)개"
                delegate.searchResultTableView.reloadData()
                
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}



//
//  searchHospitalResponse.swift
//  RisingTest
//
//  Created by 안다영 on 2022/08/09.
//

//import Foundation
//
//// MARK: - SearchHospitalResponse
//struct SearchHospitalResponse: Codable {
//    let medicalInstitInfo: MedicalInstitInfo
//
//    enum CodingKeys: String, CodingKey {
//        case medicalInstitInfo = "MedicalInstitInfo"
//    }
//}
//
//// MARK: - MedicalInstitInfo
//struct MedicalInstitInfo: Codable {
//    let header: Header
//    let item: [Item]
//    let numOfRows, pageNo, totalCount: Int
//}
//
//// MARK: - Header
//struct Header: Codable {
//    let code, message: String
//}
//
//// MARK: - Item
//struct Item: Codable {
//    let institNm, institKind, medicalInstitKind, zipCode: String
//    let streetNmAddr, tel, organLOC, monday: String
//    let tuesday, wednesday, thursday, friday: String
//    let saturday, sunday, holiday, sundayOperWeek: String
//    let examPart, registDt, updateDt, lng: String
//    let lat: String
//
//    enum CodingKeys: String, CodingKey {
//        case institNm = "instit_nm"
//        case institKind = "instit_kind"
//        case medicalInstitKind = "medical_instit_kind"
//        case zipCode = "zip_code"
//        case streetNmAddr = "street_nm_addr"
//        case tel
//        case organLOC = "organ_loc"
//        case monday = "Monday"
//        case tuesday = "Tuesday"
//        case wednesday = "Wednesday"
//        case thursday = "Thursday"
//        case friday = "Friday"
//        case saturday = "Saturday"
//        case sunday = "Sunday"
//        case holiday
//        case sundayOperWeek = "sunday_oper_week"
//        case examPart = "exam_part"
//        case registDt = "regist_dt"
//        case updateDt = "update_dt"
//        case lng, lat
//    }
//}
import Foundation

// MARK: - SearchHospitalResponse
struct SearchHospitalResponse: Codable {
    let medicalInstitInfo: MedicalInstitInfo

    enum CodingKeys: String, CodingKey {
        case medicalInstitInfo = "MedicalInstitInfo"
    }
}

// MARK: - MedicalInstitInfo
struct MedicalInstitInfo: Codable {
    let header: Header
    let body: Body
}

// MARK: - Body
struct Body: Codable {
    let items: Items
    let numOfRows, pageNo, totalCount: Int
}

// MARK: - Items
struct Items: Codable {
    let item: [Item]
}

// MARK: - Item
struct Item: Codable {
    let institNm, institKind, medicalInstitKind, zipCode: String
    let streetNmAddr, tel, organLOC, monday: String
    let tuesday, wednesday, thursday, friday: String
    let saturday, sunday, holiday, sundayOperWeek: String
    let examPart, registDt, updateDt, lng: String
    let lat: String

    enum CodingKeys: String, CodingKey {
        case institNm = "instit_nm"
        case institKind = "instit_kind"
        case medicalInstitKind = "medical_instit_kind"
        case zipCode = "zip_code"
        case streetNmAddr = "street_nm_addr"
        case tel
        case organLOC = "organ_loc"
        case monday = "Monday"
        case tuesday = "Tuesday"
        case wednesday = "Wednesday"
        case thursday = "Thursday"
        case friday = "Friday"
        case saturday = "Saturday"
        case sunday = "Sunday"
        case holiday
        case sundayOperWeek = "sunday_oper_week"
        case examPart = "exam_part"
        case registDt = "regist_dt"
        case updateDt = "update_dt"
        case lng, lat
    }
}

// MARK: - Header
struct Header: Codable {
    let resultCode, resultMsg: String
}

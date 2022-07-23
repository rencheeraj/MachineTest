//
//  ProductsModel.swift
//  MachineTest 1
//
//  Created by Rencheeraj on 22/07/22.
//

import Foundation

enum CellTye: String, Codable {
    case category = "category"
    case banner = "banners"
    case product = "products"
}


struct ProductModel: Codable {
    let homeData : [HomeData]?
}

struct HomeData: Codable {
    let type: CellTye?
    let values: [ValueDetails]?
   
}
struct ValueDetails: Codable {
    let id: Int?
    let name: String?
    let image_url: String?
    let image: String?
    let banner_url: String?
    let actual_price: String?
    let offer_price: String?
    let offer: Int?
    let is_express: Bool?
}

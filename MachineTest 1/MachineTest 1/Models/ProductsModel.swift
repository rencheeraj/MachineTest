//
//  ProductsModel.swift
//  MachineTest 1
//
//  Created by Rencheeraj on 22/07/22.
//

import Foundation

struct ProductModel: Codable {
    let homeData : [HomeData]?
}

struct HomeData: Codable {
    let type: String?
    let values: [ValueDetails]?
   
}
struct ValueDetails: Codable {
    let id: Int?
    let name: String?
    let image_url: String?
}

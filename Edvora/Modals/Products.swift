//
//  Products.swift
//  Edvora
//
//  Created by Dhruv Shrivastava on 01/09/22.
//

import Foundation

struct Products: Codable {
    let product_id: Int
    let name: String
    let stock: Int
    let selling_price: Int
}

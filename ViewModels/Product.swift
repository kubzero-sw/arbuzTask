//
//  Product.swift
//  arbuzTask
//
//  Created by Rashid Karina on 18.05.2024.
//

import Foundation
struct Product: Identifiable {
    let id = UUID()
    let imageName: String
    let name: String
    let minQuantity: Int
    let price: Double
    var isLiked: Bool = false
}

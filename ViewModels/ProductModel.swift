//
//  ProductModel.swift
//  arbuzTask
//
//  Created by Rashid Karina on 19.05.2024.
//

import SwiftUI

struct ProductModel: Identifiable {
    var id = UUID()
    var prodName: String
    var imageName: String
    var price: Int
    var isLiked: Bool = false
    var weight: String
    var minWeight: Double
    var measureUnit: String
    var description: String
}


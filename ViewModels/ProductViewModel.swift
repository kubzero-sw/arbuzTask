//
//  ProductViewModel.swift
//  arbuzTask
//
//  Created by Rashid Karina on 19.05.2024.
//

import SwiftUI

class ProductViewModel: ObservableObject {
    static let shared = ProductViewModel()
    
        @Published var products: [ProductModel] = [
                ProductModel(prodName: "Семга стейк Arbuz", imageName: "semga", price: 8990, weight: "0.7 кг", minWeight: 0.7, measureUnit: "кг",description: "арбузарбузарбузарбузарбузарбуз"),
                ProductModel(prodName: "стейк Arbuz", imageName: "semga", price: 6990, weight: "1 кг", minWeight: 0.8, measureUnit: "кг", description: "арбузарбузарбуз"),
                ProductModel(prodName: "Арбуз Arbuz", imageName: "semga", price: 990, weight: "1 шт", minWeight: 1, measureUnit: "шт",description: "арбузарбуз")
            ]
    @Published var cart: [ProductModel] = []

        func addToCart(product: ProductModel) {
            cart.append(product)
        }

        func removeFromCart(product: ProductModel) {
            if let index = cart.firstIndex(where: { $0.id == product.id }) {
                cart.remove(at: index)
            }
        }
    var totalCost: Double {
        return cart.reduce(0) { $0 + Double($1.price) * $1.minWeight }
    }
    func toggleLike(product: ProductModel) {
            if let index = products.firstIndex(where: { $0.id == product.id }) {
                products[index].isLiked.toggle()
            }
        }
    }

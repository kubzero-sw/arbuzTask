//
//  PrroductDetail.swift
//  arbuzTask
//
//  Created by Rashid Karina on 20.05.2024.
//

import SwiftUI

struct ProductDetail: View {
    var product: ProductModel
    @ObservedObject var viewModel: ProductViewModel
    @State private var quantity = 0
    
    var body: some View {
        VStack {
            Image(product.imageName)
                .resizable()
                .scaledToFit()
                .frame(height: 200)
                .cornerRadius(20)
                .padding()
            
            Text(product.prodName)
                .font(.title)
                .padding(.bottom)
            
            Text(product.description)
                .padding()
            HStack {
                Text("\(product.price) т / \(product.measureUnit)")
                    .foregroundColor(.primaryApp)
                Spacer()
                Text(product.weight)
                    .foregroundColor(.secondaryApp)
            }
            if quantity == 0 {
                Button(action: {
                    quantity += 1
                    viewModel.addToCart(product: product)
                })
                {
                    Text("Добавить в корзину за \(Int(Double(product.price) * product.minWeight)) т")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(10)
                }
            } else {
                HStack {
                    Button(action: {
                        if quantity > 0 {
                            quantity -= 1
                            viewModel.removeFromCart(product: product)
                        }
                    })
                    {
                        Image(systemName: "minus")
                            .frame(width: 20, height: 20)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                    Text("\(quantity)")
                        .padding(.horizontal, 10)
                        .foregroundColor(.primaryApp)
                    Button(action: {
                        quantity += 1
                        viewModel.addToCart(product: product)
                    }) {
                        Image(systemName: "plus")
                            .frame(width: 20, height: 20)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                }
                .padding(10)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
            }
            Spacer()
        }
        .padding()
    }
}

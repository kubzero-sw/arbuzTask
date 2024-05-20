//
//  ProductCard.swift
//  arbuzTask
//
//  Created by Rashid Karina on 19.05.2024.
//

import SwiftUI

struct ProductCard: View {
    var product: ProductModel
    @ObservedObject var viewModel: ProductViewModel
    @State private var isShowingDetail = false
    @State private var quantity = 0
    var body: some View {
        VStack {
            Image(product.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 100,height: 80)
            Spacer()
            
            Text(product.prodName)
                .foregroundColor(.primaryApp)
            HStack {
            Spacer()
            Button(action: {
                viewModel.toggleLike(product: product)
            }) {
                Image(systemName: product.isLiked ? "heart.fill" : "heart")
                    .foregroundColor(product.isLiked ? .red : .gray)
            }
            }
            .padding(5)
            HStack{
                Text("\(product.price) т/ \(product.measureUnit)")
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
                    Text("\(Int(Double(product.price) * product.minWeight)) т")
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
                    }) {
                        Image(systemName: "minus")
                            .frame(width: 10, height: 10)
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                    Text("\(quantity)")
                        .padding(.horizontal, 10)
                    Button(action: {
                        quantity += 1
                        viewModel.addToCart(product: product)
                    }) {
                        Image(systemName: "plus")
                            .frame(width: 10, height: 10)
                            .padding()
                            .background(Color.green)
                            .foregroundColor(.white)
                            .cornerRadius(5)
                    }
                }
                .padding(10)
                .background(Color.gray.opacity(0.2))
                .cornerRadius(20)
            }
        }
        .padding(15)
        .frame(width: 180, height: 220)
        .cornerRadius(20)
        .onTapGesture {
            isShowingDetail = true
        }
        .sheet(isPresented: $isShowingDetail) {
            ProductDetail(product: product, viewModel: viewModel)
        }
    }
}

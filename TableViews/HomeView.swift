//
//  HomeView.swift
//  arbuzTask
//
//  Created by Rashid Karina on 15.05.2024.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: ProductViewModel
    @State private var isShowingDetail = false
    @State private var selectedProduct: ProductModel?
 
    
    
    var body: some View {
        
            ScrollView {
                VStack {
                    Image("cover1")
                        .resizable()
                        .scaledToFill()
                        .frame(height: 120)
                        .cornerRadius(20)
                        .padding(.horizontal,20)
                        .onTapGesture {
                            if !viewModel.products.isEmpty {
                                selectedProduct = viewModel.products[0] 
                                isShowingDetail = true
                            }
                        }
                    
                    ScrollView(.horizontal, showsIndicators: false ) {
                        LazyHStack(spacing: 10) {
                            ForEach(viewModel.products) {
                                product in
                                ProductCard(product: product, viewModel: viewModel)
                                    .onTapGesture {
                                        selectedProduct = product
                                        isShowingDetail = true
                                    }
                            }
                            
                            
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.top, 10)
                    
                    ScrollView(.horizontal, showsIndicators: false ) {
                        LazyHStack(spacing: 10) {
                            ForEach(viewModel.products.prefix(2)) {
                                product in
                                ProductCard(product: product, viewModel: viewModel)
                                    .onTapGesture {
                                        selectedProduct = product
                                        isShowingDetail = true
                                    }
                                
                            }
                        }
               
                    .padding(.horizontal)
                }
               
                ScrollView(.horizontal, showsIndicators: false ) {
                    LazyHStack(spacing: 10) {
                        ForEach(viewModel.products) {
                            product in
                            ProductCard(product: product, viewModel: viewModel)
                                .onTapGesture {
                                    selectedProduct = product
                                    isShowingDetail = true
                                }
                            
                        }
                    }
                    .padding(.horizontal, 20)
                    
                    
                }
            }
        }
                    .navigationTitle("Главная")
                    .toolbar {
                        NavigationLink(destination: CartView(viewModel: viewModel)) {
                            Image(systemName: "cart")
                                .foregroundColor(.primaryApp)
                        }
                    }
                      
        .sheet(isPresented: $isShowingDetail) {
            if let product = selectedProduct {
                ProductDetail(product: product, viewModel: viewModel)
            }
        }
    }
}


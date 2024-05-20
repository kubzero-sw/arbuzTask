//
//  CartView.swift
//  arbuzTask
//
//  Created by Rashid Karina on 16.05.2024.
//

import SwiftUI

struct CartView: View {
    @ObservedObject var viewModel: ProductViewModel
    @State private var isShowingCheckout = false
    @State private var isShowingLoader = false
    
    var body: some View {
        
            VStack {
                if viewModel.cart.isEmpty {
                    Text( "Добавьте товары в корзину")
                        .font(.title)
                        .foregroundColor(.secondary)
                }else{
                    List{
                        ForEach(viewModel.cart) {
                            product in
                            HStack {
                                Image(product.imageName)
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 25, height: 25)
                                    .cornerRadius(20)
                                VStack(alignment: .leading) {
                                    Text(product.prodName)
                                        .font(.headline)
                                        .foregroundColor(.primaryApp)
                                    Text("\(Int(Double(product.price) * product.minWeight)) т")
                                        .foregroundColor(.secondaryApp)
                                    
                                }
                                Spacer()
                                Text("x1")
                                    .foregroundColor(.primaryApp)
                                Button(action: {
                                    viewModel.removeFromCart(product: product)
                                    
                                }
                                ){
                                    Image(systemName: "trash")
                                        .foregroundColor(.red)
                                }
                            }
                            .padding(.vertical, 5)
                        }
                    }
                    .listStyle(PlainListStyle())
                    VStack{
                        HStack {
                            Text ("Итого:")
                                .font(.headline)
                            Spacer()
                            Text("\(Int(viewModel.totalCost)) т")
                                .font(.headline)
                        }
                        .padding()
                        
                        if viewModel.totalCost < 8000 {
                            Text("Добавьте товар на \(Int(8000 - viewModel.totalCost)) для бесплатной доставки :)")
                                .foregroundColor(.red)
                                .padding()
                            
                        }
                        Button(action: {
                            isShowingLoader = true
                            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                                isShowingLoader = false
                                isShowingCheckout = true
                                
                            }
                        }){
                            Text("Перейти к оплате")
                                .foregroundColor(.white)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(viewModel.totalCost < 8000 ? Color.gray : Color.blue)
                                .cornerRadius(10)
                        }
                        .disabled(viewModel.totalCost < 8000)
                        .padding()
                    }
                }
            }
            .navigationTitle("Корзина")
            .overlay(
                Group {
                    if isShowingLoader {
                        VStack {
                            ProgressView()
                            Text("загрузка...")
                                .padding(.top,10)
                            
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                        .background(Color.black.opacity(0.5))
                    }
                }
            )
            .sheet(isPresented: $isShowingCheckout) {
                Text("hello world!")
                    .font(.largeTitle)
            }
        }
    }



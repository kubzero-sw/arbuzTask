//
//  ContentView.swift
//  arbuzTask
//
//  Created by Rashid Karina on 15.05.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var homeV = HomeViewModel.shared
    @StateObject var productViewModel = ProductViewModel.shared
    
    var body: some View {
        NavigationView{
            VStack{
                TabView(selection: $homeV.selectTab){
                    HomeView(viewModel: productViewModel).tag(0)
                    CatalogView().tag(1)
                    CartView(viewModel: productViewModel).tag(2)
                    FavoriteListView().tag(3)
                    ProfileView().tag(4)
                }
                .onAppear{
                    UIScrollView.appearance().isScrollEnabled = false
                }
                .tabViewStyle(.page(indexDisplayMode: .never))
                .onChange(of: homeV.selectTab){ newValue in
                    debugPrint("Sel Tab : \(newValue)")
                }
                HStack {
                    TabButton(title: "Главная", icon: "home", isSelect: homeV.selectTab == 0) {
                        homeV.selectTab = 0
                    }
                    TabButton(title: "Каталог", icon: "catalog", isSelect: homeV.selectTab == 1) {
                        homeV.selectTab = 1
                    }
                    TabButton(title: "Корзина", icon: "korzina", isSelect: homeV.selectTab == 2) {
                        homeV.selectTab = 2
                    }
                    TabButton(title: "Избранное", icon: "heart", isSelect: homeV.selectTab == 3) {
                        homeV.selectTab = 3
                    }
                    TabButton(title: "Профиль", icon: "profile", isSelect: homeV.selectTab == 4) {
                        homeV.selectTab = 4
                    }
                }
                
                .padding(.top, 10)
                .padding(.horizontal, 6)
                .background(Color.white)
                .cornerRadius(15)
                .shadow(color: Color.black.opacity(0.15), radius: 3, x: 0, y: -2)
            }
        }
        
        
    }
    
}

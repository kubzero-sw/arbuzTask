//
//  HomeViewModel.swift
//  arbuzTask
//
//  Created by Rashid Karina on 16.05.2024.
//

import SwiftUI

class HomeViewModel: ObservableObject  {
    static var shared: HomeViewModel = HomeViewModel()
    @Published var selectTab:Int = 0
}


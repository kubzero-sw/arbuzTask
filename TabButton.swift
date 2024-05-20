//
//  TabButton.swift
//  arbuzTask
//
//  Created by Rashid Karina on 16.05.2024.
//

import SwiftUI

struct TabButton: View {
    @State var title: String = "title"
    @State var icon: String = "home"
    var isSelect: Bool = false
    var didSelect: ( ()->() )?
    var body: some View {
        Button {
           debugPrint("tab button")
            didSelect?()
        }
    label: {
        VStack {
            Image(icon)
                .resizable()
                .frame(width: 25, height: 25)
            
            Text(title)
                .font(.system(size: 13))
                .lineLimit(1)
                .fixedSize(horizontal: true, vertical: false)
        }
    }
    .foregroundColor(isSelect ? .secondaryApp : .primaryApp)
    .frame(minWidth: 0, maxWidth: .infinity)
    }
}

#Preview {
    TabButton()
}

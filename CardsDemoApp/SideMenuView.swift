//
//  SideMenuView.swift
//  CardsDemoApp
//
//  Created by Tatyana on 13.04.2021.
//

import SwiftUI

struct SideMenuView: View {
    var body: some View {
        VStack(spacing: 30) {
            
            
            Image("Certificate2")
//                .clipShape(Circle())
                .resizable()
                .frame(width: 80    , height: 80)
            
//                .border(Color.black)
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text("Hello, World!")
            Text("Hello, World!")
            
            
            Spacer()
        }
        .padding(40)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .padding(.trailing, 80)
    }
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView()
    }
}

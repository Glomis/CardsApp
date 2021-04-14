//
//  SideMenuView.swift
//  CardsDemoApp
//
//  Created by Max on 13.04.2021.
//

import SwiftUI

struct SideMenuView: View {
    var menu = menuData
    @Binding var showMenu: Bool
    
    var body: some View {
        VStack(spacing: 30) {
            Image("Certificate2")
                .resizable()
                .frame(width: 80    , height: 80)
            
            ForEach(menu) { item in
                MenuRow(name: item.tittle, image: item.icon
                )
            }
            
            Spacer()
        }
        .padding(30)
        .frame(minWidth: 0, maxWidth: .infinity)
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .padding(.trailing, 80)
        .offset(x: showMenu ? 0 : -UIScreen.main.bounds.width)
        .rotation3DEffect(
            Angle(degrees: showMenu ? 0 : 60),
            axis: (x: 0, y: 10, z: 0)
        )
        .animation(.spring())
        .onTapGesture {
            showMenu.toggle()
        }
    }
    
}

struct SideMenuView_Previews: PreviewProvider {
    static var previews: some View {
        SideMenuView(showMenu: .constant(true))
    }
}

//MARK: Menu Row
struct MenuRow: View {
    var name = "My account"
    var image = "gear"
    
    var body: some View {
        HStack {
            Image(systemName: image)
                .imageScale(.large)
                .foregroundColor(Color("icons"))
                .frame(width: 32, height: 32)
            
            Text(name)
                .font(.headline)
            Spacer()
        }
    }
}


//MARK: Menu Data
struct Menu: Identifiable  {
    var id = UUID()
    var tittle: String
    var icon: String
}

let menuData = [
    Menu(tittle: "My account", icon: "person.crop.circle"),
    Menu(tittle: "Billing", icon: "creditcard"),
    Menu(tittle: "Team", icon: "person.and.person"),
    Menu(tittle: "Sign out", icon: "arrow.uturn.down")
]

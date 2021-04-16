//
//  HomeView.swift
//  CardsDemoApp
//
//  Created by Tatyana on 14.04.2021.
//

import SwiftUI

struct HomeView: View {
    
    @State private var showMenu = false
    @State private var showProfile = false
    @State private var showBell = false
    // Изменить имя
    
    var body: some View {
        ZStack(alignment: .top) {
            HomeList()
                .blur(radius: showMenu ? 20 : 0)
                .scaleEffect(showProfile ? 0.95 : 1)
                .animation(.default)
                
    
            ContentView()
                .background(Color.white)
                .cornerRadius(30)
                .shadow(radius: 20)
                .animation(.spring())
                .offset(y: showProfile ? 0 : UIScreen.main.bounds.height)
            
            HStack(spacing: 15) {
                CapsuleButton(showSideMenu: $showMenu)
                    .offset(y: showProfile ? 50 : 0)
                    .animation(.default)
                Spacer()
                
                CircleButton(imageName: "person.crop.circle", show: $showProfile)
                
                CircleButton(imageName: "bell", show: $showBell)
                    .padding(.trailing, 10)
                    .padding(.vertical)
            }
            
            SideMenuView(showMenu: $showMenu)
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}

struct CircleButton: View {
    var imageName: String
    @Binding var show: Bool
    
    var body: some View {
        Button(action: { show.toggle() }) {
            Image(systemName: imageName)
                .foregroundColor(.black)
                .frame(width: 50, height: 50)
                .background(Color.white)
                .clipShape(Circle())
                .shadow(color: Color("buttonShadow"),
                        radius: 10, x: 0, y: 10)
        }
    }
}

struct CapsuleButton: View {
    @Binding var showSideMenu : Bool
    
    var body: some View {
        Button(action: { showSideMenu.toggle() }) {
            HStack {
                Spacer()
                Image(systemName: "list.dash")
                    .foregroundColor(.black)
            }
            .padding(.trailing, 20)
            .frame(width: 90, height: 60)
            .background(Color.white)
            .cornerRadius(30)
            .offset(x: -35)
            .shadow(color: Color("buttonShadow"), radius: 10, x: 0, y: 10)
        }
    }
}

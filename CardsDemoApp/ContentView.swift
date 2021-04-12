//
//  ContentView.swift
//  CardsDemoApp
//
//  Created by Tatyana on 12.04.2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            TitleView()
            
            CardView(cardName: "Card name",
                     discription: "Discription",
                     image: "Certificate1",
                     color: Color.red
            )
            .offset(y: -40)
            .scaleEffect(0.94)

            CardView(cardName: "Card name",
                     discription: "Disc",
                     image: "Certificate3",
                     color: Color.blue
            )
            .offset(y: -20)
            .scaleEffect(0.97)
            
            CardView(cardName: "Card name",
                     discription: "Discription",
                     image: "Background",
                     color: Color.black
            )
//            .rotationEffect(Angle(degrees: 10))
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


//MARK: TitlView
struct TitleView: View {
    var body: some View {
        VStack(spacing: 1) {
            HStack {
                Text("Courses")
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .padding()
                Spacer()
            }
            
            Image("Illustration5")
//                .resizable()
//                .aspectRatio(contentMode: .fit)
            Spacer()
        }
        .padding(.bottom)
    }
}

//MARK: CardView
struct CardView: View {
    
    var cardName = "Card name"
    var discription = "Discription"
    var image: String
    var color: Color
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 8) {
                    Text(cardName)
                        .font(.title)
                        .fontWeight(.bold)
                    Text(discription)
                        .font(.subheadline)
                }
                .padding()
                .foregroundColor(.white)
                Spacer()
                Image("Logo")
                    .padding(.trailing, 20)
                    .padding(.top, 10)
            }
            Spacer()
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
        }
        .frame(width: 340, height: 240)
        .background(color)
        .cornerRadius(20)
        .shadow(radius: 20)
    }
}
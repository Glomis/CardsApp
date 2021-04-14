//
//  ContentView.swift
//  CardsDemoApp
//
//  Created by Max on 12.04.2021.
//

import SwiftUI

struct ContentView: View {
    
    @State private var tap = false
    
    var body: some View {
        ZStack {
            TitleView()
                .blur(radius: tap ? 10 : 0)
            
            
            CardView(cardName: "Card name",
                     discription: "Discription",
                     image: "Certificate1",
                     color: Color("background10")
            )
            .offset(y: tap ? -200 : -40)
            .scaleEffect(0.94)
            .rotationEffect(Angle(degrees: tap ? 20 : 0))
            
            
            CardView(cardName: "Card name",
                     discription: "Disc",
                     image: "Certificate3",
                     color: Color("background8")
            )
            .offset(y: tap ? -100 : -20)
            .scaleEffect(0.97)
            .rotationEffect(Angle(degrees: tap ? 15 : 0))
            
            
            CardView(cardName: "Card name",
                     discription: "Discription",
                     image: "Background",
                     color: Color.black
            )
            .rotationEffect(Angle(degrees: tap ? 10 : 0))
            .onTapGesture {
                withAnimation(.spring()) {
                    tap.toggle()
                }
            }
            
            // Добавить перетаскивание объектов
            BottomCertificate()
                .blur(radius: tap ? 10 : 0)
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

//MARK: Bottom Certificate View
struct BottomCertificate: View {
    var body: some View {
        VStack(spacing: 20) {
            Rectangle()
                .frame(width: 70, height: 8)
                .cornerRadius(10)
                .opacity(0.1)
            Text("Сертификат о проделанной работе и успешно выполенном задании.")
            Spacer()
        }
        .frame(minWidth: 0, maxWidth: .infinity)
        .padding()
        .background(Color.white)
        .cornerRadius(30)
        .shadow(radius: 20)
        .offset(y: 600)
    }
}

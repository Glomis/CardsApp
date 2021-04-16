//
//  HomeList.swift
//  CardsDemoApp
//
//  Created by Tatyana on 15.04.2021.
//

import SwiftUI

struct HomeList: View {
    var courses = coursesData
    @State var press = false
    
    var body: some View {
        
        
        VStack {
            HStack {
                VStack(alignment: .leading) {
                    Text("Courses")
                        .font(.largeTitle)
                        .fontWeight(.bold)
                    Text("22 lessons")
                        .foregroundColor(.gray)
                }
                .padding(.leading, 65)
                .padding(.top, 10)
                
                Spacer()
            }
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 20) {
                        ForEach(courses) { course in
                            Button(action: {press.toggle()} ) {
                                CourseView(name: course.tittle,
                                           image: course.image,
                                           color: course.color,
                                       shadowColor: course.shadowColor)
                            }
                            .sheet(isPresented: $press, content: {
                                ContentView()
                            })
                        }
                }
                .padding(20)
                .padding(.vertical)
                
            }
        }
        
//        .padding(.leading, 20)
    }
}


struct HomeList_Previews: PreviewProvider {
    static var previews: some View {
        HomeList()
    }
}

//MARK: CourseView
struct CourseView: View {
    var name: String
    var image: String
    var color: String
    var shadowColor: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(name)
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(.white)
                .lineLimit(3)
                .padding()
                .padding(.leading, 20)
                .frame(width: 170)
            Spacer()
            Image(image)
                .resizable()
                .renderingMode(.original)
                .aspectRatio(contentMode: .fit)
                .frame(width: 246, height: 155)
                .padding(.bottom, 30)
        }
        .background(Color(color))
        .cornerRadius(30)
        .frame(width: 246, height: 330)
        .shadow(color: Color(shadowColor), radius: 20, x: 0, y: 10)
    }
}

//MARK: Course Data

struct Course: Identifiable {
    var id = UUID()
    var tittle: String
    var image: String
    var color: String
    var shadowColor: String
}

let coursesData = [
    Course(tittle: "Bild an app with SwiftUI",
           image: "Illustration1",
           color: "background8",
           shadowColor: "backgroundShadow3"),
    Course(tittle: "Create your oun Big Data",
           image: "Illustration2",
           color: "background4",
           shadowColor: "backgroundShadow4")
]

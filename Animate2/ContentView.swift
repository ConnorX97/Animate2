//
//  ContentView.swift
//  Animate2
//
//  Created by Sherzod Fayziev on 2022/06/02.
//

import SwiftUI

struct ContentView: View {
    @State var toggle = false
    
    
    var body: some View {
        ZStack {
            ZStack{
                Rectangle()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .cornerRadius(50)
                
                    .foregroundColor(.white)
                    .shadow(color: .black .opacity(toggle ? 0.3 : 0), radius: 20, x: 0, y: 50)
                    .scaleEffect(toggle ? 0.9 : 1)
                    .ignoresSafeArea(.all)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 10){
                            ForEach(sectionData) { item in
                                GeometryReader { geometry in
                            WindowView(section: item)
                                } .frame(width: 170, height: 270)
                            .padding()
                        }
                    }
                }
                
                
                VStack {
                    HStack{
                    Button(action: {
                        self.toggle.toggle()
                    }, label: {
                        Text("Knopka")
                            .padding(.all)
                            .background(.red)
                            .foregroundColor(.black)
                            .cornerRadius(15)
                    }).padding()
                        Spacer()
                        
                        Button(action: {
                            self.toggle.toggle()
                        }, label: {
                            Text("Ikkinchi Knopka")
                                .padding()
                                .background(.yellow)
                                .foregroundColor(.black)
                                .cornerRadius(15)
                        })
                        .padding(.trailing)
                    }
                    
                    Spacer()
                } // Button
            }
            .rotation3DEffect(Angle(degrees: toggle ? 15 : 0), axis: (x: -12, y:0, z: 0))
            .onTapGesture {
                self.toggle = false
            }
            menuWindow()
                .onTapGesture {
                    self.toggle = false
                }
                .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
                .offset(y: toggle ? 240 : 500)
        }
        .offset( y: toggle ? -240 : 0)
        .animation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct WindowView: View {
    var section: Section
    var body: some View {
        VStack {
            Spacer()
            VStack{
                HStack{
                    Text(section.title)
                    section.logo
                }
                section.image
                    .font(.system(size: 120))
            }
            
            .frame(width: 170, height: 170)
            .padding()
            .background(section.color)
            .cornerRadius(30)
            .offset(x: 0, y: 0)
            Spacer()
            Spacer()
            Spacer()
            
        }
        .shadow(color: .black .opacity(0.6), radius: 20, x: 0, y: 20)
    }
}


struct Section: Identifiable {
    var id = UUID()
    var title: String
    var logo : Image
    var image: Image
    var color: Color
}

let sectionData = [

    Section(title: "First Lesson", logo: Image(systemName: "camera"), image: Image(systemName: "camera"), color: Color(.red)),
    
    Section(title: "Second Lesson", logo: Image(systemName: "gear"), image: Image(systemName: "gear"), color: Color(.cyan)),

    Section(title: "Third Lesson", logo: Image(systemName: "trash"), image: Image(systemName: "trash"), color: Color(.yellow))


]

//
//  menuWindow.swift
//  Animate2
//
//  Created by Sherzod Fayziev on 2022/06/02.
//

import SwiftUI

struct menuWindow: View {
    var gradient = LinearGradient(colors: [.gray, .white], startPoint: .top, endPoint: .bottom)
    var body: some View {
        VStack {
            Spacer()
            ZStack {
                Rectangle()
                    .foregroundColor(.white)                    .frame(width: .infinity, height: 280)
                    .cornerRadius(30)
                    .shadow(radius: 10)
                    .padding(.horizontal, 25)
                    .padding(.bottom, 20)
                HStack{
                    Image(systemName: "gear")
                Text("Settings")

                    
                }
            }
        }
    }
}

struct menuWindow_Previews: PreviewProvider {
    static var previews: some View {
        menuWindow()
    }
}

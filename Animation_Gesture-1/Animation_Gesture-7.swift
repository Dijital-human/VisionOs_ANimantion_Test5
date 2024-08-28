//
//  Animation_Gesture-7.swift
//  Animation_Gesture-1
//
//  Created by Famil Mustafayev on 20.08.24.
//

import SwiftUI

struct Animation_Gesture_7: View {
    @State private var show: Bool = false
    @State private var degre:Double = 0.0
    var body: some View {
        ZStack(alignment: .top, content: {
            RoundedRectangle(cornerRadius: 25.0).fill(Color("cl-1"))
            
            VStack(spacing: 12.0){
                Text("Animation Gesture Test - 7").foregroundStyle(Color("fcl"))
                Text("Spring Animation").font(.system(size: 32)).foregroundStyle(.gray)
                Button("Clicked") {
                    show.toggle()
                }.font(.system(size: 32)).frame(width: 300, height: 50).background(Capsule().fill(Color("fcl")))
                
                
                HStack(spacing: 30.0){
                    Spacer()
                    Image(systemName: "person")
                    Image(systemName: "person")
                    Image(systemName: "person")
                    Image(systemName: "person")
                    Image(systemName: "person")
                    Button(action: {
                        withAnimation(.bouncy(duration: 2)) {
                            show.toggle()
                        }
                    }, label: {
                        Image(systemName: "line.3.horizontal").font(.system(size: 44))
                            .rotationEffect(.degrees(-90))
                    })
                }.frame(maxWidth: .infinity, maxHeight: 60).background(Capsule().fill(Color("fcl"))).font(.system(size: 32))
                    .offset(x: show ? -850 : -1200)
                
                
                Circle().fill(Color("fcl")).frame(width: 100, height: 100)
                    .overlay {
                        Image(systemName: "1.circle.fill")
                    }
                    .overlay {
                        Circle().stroke(.blue,lineWidth: 5)
                            .scaleEffect(show ? 1.5 : 1)
                            .animation(.bouncy, value: show)
                    }
                    
                    .animation(.bouncy(duration: 2).delay(1).repeatCount(5, autoreverses: false), value: show)
                    .offset(x: show ? 500 : -900)

               
                    Image(systemName: "fanblades")
                        
                    .rotationEffect(.degrees(degre))
                   
                    .onTapGesture {
                        withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                            show.toggle()
                            degre = 360
                        }
                    }
                
            }.padding(.top, 30).font(Font.custom("Times New Roman", size: 64)).italic()
        })
    }
}

#Preview {
    Animation_Gesture_7()
}

//
//  Animation_Gesture-5.swift
//  Animation_Gesture-1
//
//  Created by Famil Mustafayev on 20.08.24.
//

import SwiftUI

struct Animation_Gesture_5: View {
    let gradiantColor = RadialGradient(colors: [Color.init("cl-1"), Color.init("cl-2")], center: .center, startRadius: 50, endRadius: CGFloat(150.0))
    @State private var username: String = ""
    @State private var password: String = ""
    @State var show: Bool = false
    @State var show1: Bool = false

    var body: some View {
        ZStack(alignment: .top, content: {
            RoundedRectangle(cornerRadius: 25.0).fill(gradiantColor)
            RoundedRectangle(cornerRadius: 25.0).stroke(Color.init("fcl"),style: StrokeStyle(lineWidth: 10.0, dash: [20, 5]))
            VStack(spacing: 25.0){
                Text("Soru Cozumu")
                Text("Oturum Acin").font(.system(size: 44)).foregroundStyle(.gray)
                Image(systemName: "lock.shield").font(.system(size: 120))
                    .scaleEffect(show ? 1 : 2)
//                    .onTapGesture {
//                        withAnimation(.bouncy(duration: 2)) {
//                            show.toggle()
//                        }
//                    }
                
                VStack(spacing: 20.0){
                    ZStack{
                        RoundedRectangle(cornerRadius: 25.0)
                            .stroke(Color.init("fcl"))
                        TextField(text: $username) {
                            Text("Ended your username:")
                        }.padding(.horizontal)
                    }.frame(height: 80)
                    ZStack{
                        RoundedRectangle(cornerRadius: 25.0)
                            .stroke(Color.init("fcl"))
                        SecureField(text: $password) {
                            Text("Ended your password:")
                        }.padding(.horizontal)
                    }.frame(height: 80)
                    
                    
                }
                
                .textFieldStyle(.roundedBorder)
                .frame(width: 700)
                .padding(30)
                .background(content: {
                    RoundedRectangle(cornerRadius: 25.0).stroke(Color.init("fcl"), lineWidth: 5)
                })
                .font(.system(size: 22))
                .offset(x: show ? 0 : -1280)
                .scaleEffect(show1 ? 1 : 1.1)
                ZStack(content: {
                    RoundedRectangle(cornerRadius: 25.0).stroke(Color.init("fcl"),lineWidth: show ? 5 : 1)
                    Text("Sign in")
                        .frame(maxWidth: .infinity)
                        .font(.system(size: 32))
                        .fontWeight(show ? .bold : .regular)
                }).frame(width: 500, height: 60)
                    .offset(x: show ? 0 : -1280)
                .onTapGesture {
                    withAnimation(.bouncy(duration: 2)) {
                        show.toggle()
                    }
                }
                Spacer()
            }
            .font(Font.custom("DIN Condensed Bold", size: 64))
            .padding(.top)
            .foregroundStyle(Color.init("fcl"))
        })
        .onAppear(){
            withAnimation(.bouncy(duration: 2)) {
                show = true

            }
            withAnimation(.bouncy(duration: 2).delay(3)) {
                show1 = true
            }
        }
    }
}

#Preview {
    Animation_Gesture_5()
}

//
//  Animation_Gesture-6.swift
//  Animation_Gesture-1
//
//  Created by Famil Mustafayev on 20.08.24.
//

import SwiftUI

struct Animation_Gesture_6: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var show: Bool = false
    var body: some View {
        ZStack(alignment: .top, content: {
            RoundedRectangle(cornerRadius: 25.0).fill(Color.init("cl-1"))
            VStack(spacing: 20.0){
                Text("Animation Gesture Test - 6").monospaced()
                VStack(spacing: 20.0){
                    Image(systemName: "lock.shield").font(.system(size: 100))
                    Text("RadialGradient isdifade etdikden sonra giris sehifesini duzeldek").font(.system(size: 22))
                    VStack(spacing: 20){
                        ZStack(content: {
                            RoundedRectangle(cornerRadius: 5.0).stroke(Color.init("fcl"))
                            TextField(text: $username) {
                                Text("Ended your username:")
                            }.padding(.horizontal)
                        })
                        ZStack(content: {
                            RoundedRectangle(cornerRadius: 5.0).stroke(Color.init("fcl"))
                            SecureField(text: $password) {
                                Text("Ended your password:")
                            }.padding(.horizontal)
                        })
                    }.frame(height: 160).padding(.horizontal).font(.system(size: 30))
                    VStack(spacing: 20.0){
                        Text("Sign in").frame(maxWidth: .infinity)
                                
                        .padding().font(.system(size: 22)).background{
                            RoundedRectangle(cornerRadius: 25.0).fill(.blue)
                        }
                        .onTapGesture {
                            show.toggle()
                        }
                        Text("Registration").font(.title).foregroundStyle(.secondary)
                    }.padding(.horizontal, 30)
                }
                .padding(.horizontal, 30)
                

                .frame(maxWidth: 800, maxHeight: 550)
                
                
                .background {
                    RoundedRectangle(cornerRadius: 15.0).fill(.black.opacity(0.4))
                        .shadow(color: Color.init("cl-2"), radius: 3, x: 10.0, y: 10.0)
                        .shadow(color: Color.init("cl-2"), radius: 3, x: -10.0, y: 10.0)
                }
                .offset(x: show ? 0 : -1280)
                .scaleEffect(show ? 1 : 5.5,anchor: .center)
                .animation(.bouncy(duration: 2).delay(1), value: show)
                .onAppear(perform: {
                    show = true
                })
            }.font(Font.custom("DIN Condensed Bold", size: 44)).padding(.top)
            
        })
    }
}

#Preview {
    Animation_Gesture_6()
}

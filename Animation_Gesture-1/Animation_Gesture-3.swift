//
//  Animation_Gesture-3.swift
//  Animation_Gesture-1
//
//  Created by Famil Mustafayev on 20.08.24.
//

import SwiftUI

struct Animation_Gesture_3: View {
    @State private var show: Bool = false
    @State private var scale: Bool = false
    
    var body: some View {
        ZStack(alignment: .top, content: {
            Image("astronout")
                
                .resizable().aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 50))
                .blur(radius: show ? 3.0 : 0)
                .scaleEffect(x: scale ? -1.0 : 1.0)
            if show{
                RoundedRectangle(cornerRadius: 50).fill(.black.opacity(0.4))
                    
                    .onTapGesture {
                        withAnimation(.easeInOut(duration: 1)) {
                            show = false
                        }
                        
                }

            }
                
            
                VStack(alignment:.center){
                    Text("Animation Gesture Test - 3").blur(radius: show ? 3 : 1)
                    Text("Popup menyu veya Alert mesaj yeni bildirish mesaji kimide melumat vere bilerik isdifadeciye").font(.title).monospaced().bold().foregroundStyle(.gray).blur(radius: show ? 3 : 1)
                    if show{
                    VStack(alignment:.center, spacing: 15.0){
                        HStack{
                            Image(systemName: "info.circle.fill").foregroundStyle(.blue)
                                .font(.largeTitle)
                            Spacer()
                            Text("Popup menyu haqqinda melumatlar burdadi")
                            
                        }.font(.title2)
                        VStack(alignment:.leading, spacing: 20.0){
                            Text("Ekranin her hansi bir yerine klik etsen popup menyu baglanacaq").font(.title).foregroundStyle(.white).underline(color: .red).frame(height: 200)
                            Button(action: {
                                withAnimation(.bouncy(duration: 2).delay(1)) {
                                    show = false
                                }
                                
                            }, label: {
                                HStack{
                                    Text("close").font(.title)
                                    Image(systemName: "xmark.circle.fill")
                                        .foregroundColor(.blue)
                                }.frame(maxWidth: .infinity)
                            }).background{
                                Capsule().stroke(Color.blue,lineWidth: 5)
                            }
                        }
                    }
                    .padding(25)
                    .frame(maxWidth: 700)
                    
                    .background {
                        RoundedRectangle(cornerRadius: 25.0)
                            .stroke(.blue, lineWidth: 4)
                        
                    }
                    .background(RoundedRectangle(cornerRadius: 25.0).fill(.blue.opacity(0.3)))
                    .shadow(color: .black, radius: 3, x: 10, y: 10)
                    .shadow(color: .black, radius: 3, x: -10, y: -10)
                    
                    }
                    Spacer()
                        HStack{
                            Image(systemName: "info.circle.fill").padding(25)
                            //.offset(x: -590.0, y: 420.0)
                            
                                .opacity(show ? 0 : 1)
                                .onTapGesture {
                                    withAnimation(.bouncy(duration: 3)) {
                                        show = true
                                    }
                                    
                                }
                            Spacer()
                        }.frame(width: .infinity)
                }.font(Font.custom("Futura", size: 44)).monospaced().padding(.top, 60)
            
        })
    }
}

#Preview {
    Animation_Gesture_3()
}

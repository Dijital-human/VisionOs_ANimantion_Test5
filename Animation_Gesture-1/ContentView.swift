//
//  ContentView.swift
//  Animation_Gesture-1
//
//  Created by Famil Mustafayev on 20.08.24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    @State private var showPopup: Bool = false
    @GestureState private var popupShow: CGSize = .zero
    @State private var endPopup: CGFloat = CGFloat(1.0)
    var body: some View {
        ZStack{
            Image("astronout")
                .resizable()
                .aspectRatio(contentMode: .fit).clipShape(RoundedRectangle(cornerRadius: 25.0))
            VStack(spacing: 20.0){
                Text("Animate Gesture Test - 1").font(.extraLargeTitle)
                Text("Popup menu veya Aler Mesaj formasi").foregroundStyle(.gray)
                Button(action: {
                    withAnimation(.bouncy(duration: 2).delay(1)) {
                        showPopup.toggle()
                    }
                }, label: {
                    Text("Alert")
                }).background(.clear)
                Spacer()
                
            }.font(.title)
            
            ZStack{
                if showPopup{
                    Color.black.opacity(0.5)
                    
                        .onTapGesture {
                            withAnimation(.bouncy(duration: 5)) {
                                showPopup = false
                            }
                            
                        }
                    
                }
                if showPopup == false{
                    
                    Button(action: {
                        withAnimation(.bouncy(duration: 3)) {
                            showPopup.toggle()
                        }
                        
                    }, label: {
                        Image(systemName: "info.circle").font(.largeTitle).foregroundStyle(.white)
                    }).background(Capsule().fill(.blue))
                    .offset(x: -600, y: 320)

                        
                }
                if showPopup{
                    VStack(spacing: 10.0){
                        HStack{
                            Image(systemName: "info.circle.fill")
                            Spacer()
                            Text("Popup menu veya Alert mesaj")
                        }.frame(maxWidth: .infinity).padding(.horizontal, 20).background(Capsule().fill(.blue)).padding(.horizontal,3)
                        Spacer()
                        VStack{
                            Text("Popup menyunu veya Alert mesaj box baglamaq isdedikde ekranin isdenilen yerine toxunaraq baglaya bilersiniz").font(.headline).foregroundStyle(.blue)
                        }
                        Spacer()
                        
                        Button(action: {
                            withAnimation(.bouncy(duration: 3)) {
                                showPopup.toggle()

                            }
                        }, label: {
                            Text("Close").frame(width: 400)
                        }).background(Capsule().fill(.blue)).padding(.bottom, 10)
                    }
                    .frame(width: 700,height: 400, alignment: .center)
                    .background{
                        RoundedRectangle(cornerRadius: 25.0).fill(.white)
                    }
                    .offset(x: endPopup + popupShow.width, y: endPopup + popupShow.height)
                    .animation(.bouncy(duration: 2), value: UUID())
                    .gesture(DragGesture().updating($popupShow, body: { value, state, transaction in
                        state = value.translation
                    }).onEnded({ value in
                        if value.location.x > 100 || value.location.x < -100 || value.location.y > 100 || value.location.y < -100{
                            endPopup = 1.0
                            withAnimation(.bouncy(duration: 4)) {
                                showPopup = false

                            }
                            
                        }
                    }))
                }
            }
            
        }
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

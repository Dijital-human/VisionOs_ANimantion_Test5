//
//  AnimateGesture-Test- 2.swift
//  Animation_Gesture-1
//
//  Created by Famil Mustafayev on 20.08.24.
//

import SwiftUI

struct AnimateGesture_Test__2: View {
    @State var degree: Double = 0.0
    @State var drag: CGSize = CGSize(width: 1, height: 1)
    var body: some View {
        ZStack(alignment: .top){
            Image("astronout")
                .resizable(resizingMode: .stretch)
                .aspectRatio(contentMode: .fit)
                .clipShape(RoundedRectangle(cornerRadius: 50))
            RoundedRectangle(cornerRadius: 50).fill(.black.opacity(0.3))
            VStack(spacing: 30.0){
                Text("Animation Gesture Test - 2")
                    .font(.extraLargeTitle).monospaced().bold().italic()
                Text("Animate ve Gesture istifade ederek biz tetbiqlerimizde muxtelif animasiyalar ve sixilma aninda bas vere bilecek hadiseleri yoxlaya,ele ala bilirik").foregroundStyle(.gray)
                ScrollView(.horizontal) {
                        HStack(spacing: 20.0){
                        ForEach(1..<60){_ in
                            ZStack(alignment:.top){
                                Color.gray
                                VStack(spacing: 10){
                                    VStack{
                                    Image("img-1")
                                    
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(width: .infinity,height: 240)
                                        .rotationEffect(.degrees(degree))
                                        .scaleEffect(drag)
                                    }
                                    Spacer()
                                    VStack{
                                        HStack{
                                            Text("Shahin Mahmudov")
                                            Spacer()
                                            Image(systemName: "heart")
                                        }
                                        .padding(.horizontal, 5)
                                        HStack{
                                            Text("Comment")
                                            Spacer()
                                            Image(systemName: "heart")
                                        }
                                        .padding(.horizontal, 5)
                                        .padding(.bottom, 5)
                                    }.font(.headline)
                                }
                            }.frame(width: 250, height: 350)
                        }

                    }.animation(.bouncy(duration: 3), value: UUID())
                        .gesture(DragGesture().onChanged({ value in
                            drag = value.translation
                        }).onEnded({ value in
                            drag = CGSize(width: 1, height: 1)
                        }))
                }
                
            }.font(.title).foregroundStyle(.white)
        }
    }
}

#Preview {
    AnimateGesture_Test__2()
}

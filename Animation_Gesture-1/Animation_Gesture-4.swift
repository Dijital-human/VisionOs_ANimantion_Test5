//
//  Animation_Gesture-4.swift
//  Animation_Gesture-1
//
//  Created by Famil Mustafayev on 20.08.24.
//

import SwiftUI

struct Animation_Gesture_4: View {
    @State private var show: Bool = false
    @State private var reverse: Bool = false

    var colorIndex:[Color] = [.red, .blue, .cyan, .orange, .yellow]
    var body: some View {
        
        ZStack(alignment: .top, content: {
            RoundedRectangle(cornerRadius: 50).fill(.black.opacity(0.8))
            VStack{
                Text("Dijital Human")
                Text("Welcome a dijital human").font(.system(size: 32))
                    .foregroundStyle(.secondary)
                Spacer()
                HStack(spacing: 10.0){
                    Text("Dijital Human size normal heyatda yasaminizda yardimcil olacaq bir sistemdir sizlere rahat yaxsi alternativ yollar gosterecek")
                        .font(.system(size: 22))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 25.0).fill(.white.opacity(0.3)))
                    Text("Dijital Human size normal heyatda yasaminizda yardimcil olacaq bir sistemdir sizlere rahat yaxsi alternativ yollar gosterecek")
                        .font(.system(size: 22))
                        .padding()
                        .background(RoundedRectangle(cornerRadius: 25.0).fill(.white.opacity(0.3)))
                }.padding(.horizontal)
                Spacer()
                VStack{
                    HStack(spacing: 25.0){
                        ForEach(colorIndex, id: \.self){i in
                            VStack{
                                Text("\(i) ci hissede sizlere ").font(.system(size: 22))
                            }.frame(width: 225, height: 300)
                                .background {
                                    RoundedRectangle(cornerSize: CGSize(width: 20, height: 10))
                                        .fill(Color(i).opacity(0.8))
                                        .shadow(color: Color.gray, radius: 1,x: 10, y: 0)
                                        .shadow(color: Color.gray, radius: 1,x: -10, y: 0)
                                }.scaleEffect(x: show ? -1.0 : 1.0, y: reverse ? -1.0 : 1.0)
                                .onTapGesture {
                                    withAnimation(.bouncy(duration: 2).delay(1)) {
                                        show.toggle()
                                        //reverse.toggle()
                                    }
                                }
                        }
                    }
                }.padding(.bottom, 20)
            }.font(Font.custom("Optima", size: 44)).bold().monospaced()
        })
    }
}

#Preview {
    Animation_Gesture_4()
}

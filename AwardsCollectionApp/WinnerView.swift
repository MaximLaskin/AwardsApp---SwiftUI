//
//  WinnerView.swift
//  AwardsCollectionApp
//
//  Created by Maxim on 05.11.2022.
//

import SwiftUI

struct WinnerView: View {
    @State private var startAnimation = false

    @State private var quality = Int.random(in: 1...5)
    var body: some View {
        ZStack{
            LinearGradient(colors: [.blue], startPoint: .top, endPoint: .bottom)
                .ignoresSafeArea()
        VStack(spacing: 50) {
            VStack {
                HStack {
                    ForEach(0..<quality) { _ in
                        GoldenStarView()
                            .rotation3DEffect(.init(degrees: startAnimation ? 0 : -70), axis: (x: 1, y: 0, z: 0), anchor: .center)
                            .scaleEffect(startAnimation ? 1 : 0.00001)
                            .animation(.interactiveSpring(response: 1, dampingFraction: 0.7, blendDuration: 0.5).delay(0.9), value: startAnimation)
                    }
                }

                IconView(startAnimation: startAnimation, quality: quality)

                Text(quality > 2 ? "Winner!" : "Loser!")
                    .frame(width: 300)
                    .foregroundColor(quality > 2 ? .green : .red)
                    .font(.system(size: 70, weight: .bold, design: .rounded))
                    .textCase(Text.Case.uppercase)
                    .rotation3DEffect(.init(degrees: startAnimation ? 0 : -70), axis: (x: 1, y: 0, z: 0), anchor: .center)
                    .scaleEffect(startAnimation ? 1 : 0.00001)
                    .animation(.interactiveSpring(response: 1, dampingFraction: 0.7, blendDuration: 0.5).delay(0.9), value: startAnimation)
            }

            Button {
                startAnimation.toggle()
            } label: {
                Text("Start")
                    .font(.title)
                    .frame(width: 180, height: 40)
                    .foregroundColor(.white)
                    .background(Color.red)
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .shadow(radius: 10)
            }

        }
    }
    }
}


struct GoldenStarView: View {
    var body: some View {
        Image(systemName: "star.fill")
            .resizable()
            .frame(width: 50, height: 50)
            .foregroundColor(.yellow)
            .shadow(radius: 1)
    }
}

struct WinnerView_Previews: PreviewProvider {
    static var previews: some View {
        WinnerView()
    }
}


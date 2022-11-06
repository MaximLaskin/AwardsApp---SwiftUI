//
//  WinnerView.swift
//  AwardsCollectionApp
//
//  Created by Maxim on 05.11.2022.
//

import SwiftUI

struct WinnerView: View {
    @State private var startAnimation = false

    @State private var quality = 0
    var body: some View {
        ZStack{
            BackgroundView()
            VStack(spacing: 50) {
                StarsView(quality: $quality, animation: startAnimation)

                IconView(startAnimation: startAnimation, quality: quality)
                TextView(quality: quality, animation: startAnimation)

                Button {
                    if startAnimation == false {
                        quality = Int.random(in: 1...5)
                        startAnimation.toggle()
                    } else {
                        startAnimation.toggle()
                    }
                } label: {
                    Text(startAnimation ? "STOP" : "START")
                        .font(.title)
                        .bold()
                        .frame(width: 180, height: 40)
                        .foregroundColor(.white)
                        .background(Color.red)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .shadow(radius: 10)
                }

            }
        }.onAppear()
    }
}

struct GoldenStarView: View {
    let animation: Bool

    var body: some View {
        Image(systemName: "star.fill")
            .resizable()
            .frame(width: 50, height: 50)
            .foregroundColor(.yellow)
            .shadow(radius: 1)
            .rotation3DEffect(
                .init(
                    degrees: animation ? 0 : -70),
                axis: (x: 1, y: 0, z: 0),
                anchor: .center)
            .scaleEffect(animation ? 1 : 0.00001)
            .animation(
                .interactiveSpring(
                    response: 1,
                    dampingFraction: 0.7,
                    blendDuration: 0.5).delay(0.9),
                value: animation)
    }
}

//struct WinnerView_Previews: PreviewProvider {
//    static var previews: some View {
//        WinnerView()
//    }
//}

struct TextView: View {
    let quality: Int
    let animation: Bool
    var body: some View {
        Text(quality > 2 ? "Winner!" : "Loser!")
            .frame(width: 300)
            .foregroundColor(quality > 2 ? .green : .red)
            .font(
                .system(
                    size: 70,
                    weight: .bold,
                    design: .rounded)
            )
            .textCase(Text.Case.uppercase)
            .rotation3DEffect(
                .init(
                    degrees: animation ? 0 : -70),
                axis: (x: 1, y: 0, z: 0),
                anchor: .center)
            .scaleEffect(animation ? 1 : 0.00001)
            .animation(
                .interactiveSpring(
                    response: 1,
                    dampingFraction: 0.7,
                    blendDuration: 0.5).delay(0.9),
                value: animation)
    }
}

struct BackgroundView: View {
    var body: some View {
        Color.blue
            .ignoresSafeArea()
    }
}

struct StarsView: View {

    @Binding var quality: Int
    let animation: Bool
    var body: some View {
        HStack {
            ForEach(0..<quality) { _ in
                GoldenStarView(animation: animation)
            }
        }
    }
}

//
//  WinnerView.swift
//  AwardsCollectionApp
//
//  Created by Maxim on 05.11.2022.
//

import SwiftUI



struct WinnerView: View {
    @State private var startAnimation = false
    @State private var text = ""
    @State private var quality = 0
    @State private var color = Color.red

    var body: some View {
        ZStack{
            BackgroundView()
            VStack(spacing: 50) {
                StarsView(quality: $quality, animation: startAnimation)

                IconView(color: color, startAnimation: startAnimation, quality: quality)
                TextView(text: text, quality: quality, animation: startAnimation)

                Button {
                    if startAnimation == false {
                        quality = Int.random(in: 1...5)
                        switch quality {
                        case 1:
                            text = "Loser"
                            color = .gray
                        case 2:
                            text = "Bad"
                            color = .red
                        case 3:
                            text = "Normal"
                            color = .purple
                        case 4:
                            text = "Not Bad"
                            color = .green
                        case 5:
                            text = "Winner"
                            color = .orange
                        default:
                            break
                        }
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
            ForEach(0..<quality, id: \.self) { _ in
                GoldenStarView(animation: animation)
            }
        }
    }
}

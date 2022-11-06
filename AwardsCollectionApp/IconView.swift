//
//  IconView.swift
//  AwardsCollectionApp
//
//  Created by Maxim on 05.11.2022.
//

import SwiftUI
struct IconView: View {
    
    let startAnimation: Bool
    let quality: Int
    
    var body: some View {
        ZStack {
            Image(systemName: "seal.fill")
                .resizable()
                .frame(width: 300, height: 300)
                .foregroundColor(quality > 2 ? .orange : .purple)
                .shadow(radius: 10)

            Image(systemName: quality > 2 ? "crown" : "multiply")
                .resizable()
                .frame(width: 150, height: 120)
                .foregroundColor(.yellow)
        }
        .scaleEffect(startAnimation ? 1 : 0.00001)
        .rotationEffect(.degrees(startAnimation ? 0 : 180))
        .animation(
            .interactiveSpring(
                response: 1,
                dampingFraction: 0.6,
                blendDuration: 0.7).delay(0.7),
            value: startAnimation)
    }
}

struct IconView_Previews: PreviewProvider {
    static var previews: some View {
        IconView(startAnimation: true, quality: 3)
    }
}

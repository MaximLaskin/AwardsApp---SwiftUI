//
//  TextView.swift
//  AwardsCollectionApp
//
//  Created by Maxim on 07.11.2022.
//

import SwiftUI

struct TextView: View {
    let text: String
    let quality: Int
    let animation: Bool
    
    var body: some View {
        Text(text)
            .frame(width: 350)
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

struct TextView_Previews: PreviewProvider {
    static var previews: some View {
        TextView(text: "Winner", quality: 1, animation: true)
    }
}

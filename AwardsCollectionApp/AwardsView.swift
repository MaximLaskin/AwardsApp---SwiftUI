//
//  AwardsView.swift
//  AwardsCollectionApp
//
//  Created by Alexey Efimov on 17.06.2021.
//

import SwiftUI

struct AwardsView: View {
    var body: some View {
        NavigationView {
            VStack {
                ScrollView {
                    IconView(color: .orange, startAnimation: true, quality: 5)
                        .frame(width: 350, height: 350)
                    GradientRectangles()
                        .frame(width: 250, height: 250)
                    PathView()
                        .frame(width: 250, height: 250)
                    CurvesView()
                        .frame(width: 250, height: 250)
                }
            }
            .navigationBarTitle("Awards")
        }
    }
}

struct AwardsView_Previews: PreviewProvider {
    static var previews: some View {
        AwardsView()
    }
}

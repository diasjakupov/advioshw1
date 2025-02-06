//
//  CarProgressView.swift
//  advioshw1
//
//  Created by Dias Jakupov on 06.02.2025.
//

import SwiftUI

struct CarProgressView: View {
    var currentPage: Int
    var totalPages: Int

    var body: some View {
        GeometryReader { geometry in
            let width = geometry.size.width
            let carWidth: CGFloat = 30
            let progress = CGFloat(currentPage) / CGFloat(max(totalPages - 1, 1))
            
            ZStack(alignment: .leading) {
                Rectangle()
                    .fill(Color.white.opacity(0.7))
                    .frame(height: 4)
                Image(systemName: "car.fill")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: carWidth, height: carWidth)
                    .offset(x: progress * (width - carWidth))
                    .animation(.easeInOut, value: progress)
            }
        }
        .frame(height: 30)
    }
}

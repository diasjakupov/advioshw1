//
//  ContentView.swift
//  advioshw1
//
//  Created by Dias Jakupov on 03.02.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var currentPage = 0
    private let totalPages = 3

    var body: some View {
        ZStack {
            TabView(selection: $currentPage) {
                PageView(
                    title: "About Me",
                    description: "Hello! My name is Dias Jakupov, currently working as an Android Developer (1+ year, Zimran)",
                    color: .red
                )
                .tag(0)
                
                PageView(
                    title: "Why IOS?",
                    description: "I enjoy challenging myself + I always wanted to give iOS development a shot and learn something similar to my work",
                    color: .blue
                )
                .tag(1)
                
                PageView(
                    title: "Hobby",
                    description: "I love reading (favorite book - Dune, TBATE), playing video games (Cyberpunk), and doing GYM",
                    color: .green
                )
                .tag(2)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
            .animation(.easeInOut, value: currentPage)
            .simultaneousGesture(
                DragGesture(minimumDistance: 0)
                    .onEnded { value in
                        if abs(value.translation.width) < 10 && abs(value.translation.height) < 10 {
                            let screenWidth = UIScreen.main.bounds.width
                            if value.startLocation.x > screenWidth / 2 {
                                if currentPage < totalPages - 1 {
                                    withAnimation {
                                        currentPage += 1
                                    }
                                }
                            } else {
                                if currentPage > 0 {
                                    withAnimation {
                                        currentPage -= 1
                                    }
                                }
                            }
                        }
                    }
            )
            
            VStack {
                Spacer()
                CarProgressView(currentPage: currentPage, totalPages: totalPages)
                    .padding(.bottom, 30)
                    .padding(.horizontal, 30)
            }
            
            if currentPage == totalPages - 1 {
                VStack {
                    Spacer()
                    Button(action: { withAnimation { currentPage = 0 }}) {
                        Text("Return to First Page")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.black.opacity(0.7))
                            .cornerRadius(10)
                    }.padding(.bottom, 80)
                }
            }
        }
    }
}

struct PageView: View {
    let title: String
    let description: String
    let color: Color

    var body: some View {
        ZStack {
            color
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                Text(title)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                Text(description)
                    .font(.title2)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
            }
        }
    }
}

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

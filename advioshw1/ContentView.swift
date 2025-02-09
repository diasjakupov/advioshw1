//
//  ContentView.swift
//  advioshw1
//
//  Created by Dias Jakupov on 03.02.2025.
//

import SwiftUI

struct ContentView: View {
    @State private var currentPage = 0
    @State private var pulsate = false
    

    private let pages: [Page] = PageData.shared.pages


    private var isLastPage: Bool {
        currentPage == pages.count - 1
    }

    private var tabView: some View {
        TabView(selection: $currentPage) {
            ForEach(Array(pages.enumerated()), id: \.offset) { index, page in
                PageView(
                    title: page.title,
                    description: page.description,
                    color: page.color,
                    imageURL: page.imageName
                )
                .tag(index)
            }
        }
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .never))
        .animation(.easeInOut, value: currentPage)
        .simultaneousGesture(navigationGesture)
    }

    private var progressIndicator: some View {
        VStack {
            Spacer()
            CarProgressView(currentPage: currentPage, totalPages: pages.count)
                .padding(.horizontal, 30)
                .padding(.bottom, 30)
        }
    }

    private var returnButton: some View {
        VStack {
            Spacer()
            Button(action: resetToFirstPage) {
                Text("Return to First Page")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black.opacity(0.7))
                    .cornerRadius(10)
                    .scaleEffect(pulsate ? 1.1 : 1.0)
                    .animation(Animation.easeInOut(duration: 1.0)
                        .repeatForever(autoreverses: true), value: pulsate)
                    .onAppear { pulsate = true }
            }
            .padding(.bottom, 80)
        }
    }

    private var navigationGesture: some Gesture {
        DragGesture(minimumDistance: 0)
            .onEnded(handleTapGesture)
    }


    var body: some View {
        ZStack {
            tabView
            progressIndicator
            if isLastPage {
                returnButton
            }
        }
    }



    private func handleTapGesture(_ value: DragGesture.Value) {
        if abs(value.translation.width) < 10 && abs(value.translation.height) < 10 {
            let screenWidth = UIScreen.main.bounds.width
            if value.startLocation.x > screenWidth / 2, currentPage < pages.count - 1 {
                withAnimation { currentPage += 1 }
            }
            else if value.startLocation.x <= screenWidth / 2, currentPage > 0 {
                withAnimation { currentPage -= 1 }
            }
        }
    }

    private func resetToFirstPage() {
        withAnimation { currentPage = 0 }
    }
}

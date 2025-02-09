//
//  PageView.swift
//  advioshw1
//
//  Created by Dias Jakupov on 06.02.2025.
//


import SwiftUI

struct PageView: View {
    let title: String
    let description: String
    let color: Color
    let imageURL: URL? 

    @State private var animateContent = false

    var body: some View {
        ZStack {
            color
                .edgesIgnoringSafeArea(.all)
            VStack(spacing: 20) {
                Text(title)
                    .font(.largeTitle)
                    .bold()
                    .foregroundColor(.white)
                    .opacity(animateContent ? 1 : 0)
                    .offset(y: animateContent ? 0 : -20)
                    .animation(.easeInOut(duration: 0.8).delay(0.2), value: animateContent)
                
                Text(description)
                    .font(.title2)
                    .foregroundColor(.white)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                    .opacity(animateContent ? 1 : 0)
                    .offset(y: animateContent ? 0 : 20)
                    .animation(.easeInOut(duration: 0.8).delay(0.4), value: animateContent)
                
                if let imageURL = imageURL {
                    AsyncImage(url: imageURL) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                                .frame(width: 200, height: 200)
                        case .success(let image):
                            image
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                                .cornerRadius(10)
                                .shadow(radius: 5)
                                .opacity(animateContent ? 1 : 0)
                                .scaleEffect(animateContent ? 1 : 0.8)
                                .animation(.easeInOut(duration: 0.8).delay(0.6), value: animateContent)
                        case .failure(let error):
                            Text("AsyncImage failed to load with error: \(error.localizedDescription)")
                            Image(systemName: "exclamationmark.triangle.fill")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 200, height: 200)
                                .foregroundColor(.red)
                        @unknown default:
                            EmptyView()
                        }
                    }
                }
            }
            .onAppear {
                animateContent = true
            }
        }
    }
}

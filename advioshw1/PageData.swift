//
//  PageData.swift
//  advioshw1
//
//  Created by Dias Jakupov on 09.02.2025.
//


import SwiftUI

final class PageData {
    static let shared = PageData()
    
    let pages: [Page]
    
    private init() {
        pages = [
            Page(
                title: "About Me",
                description: "Hello! My name is Dias Jakupov (20 y.o), currently working as an Android Developer (1+ year, Zimran)",
                color: .red,
                imageName: URL(string: "https://media.licdn.com/dms/image/v2/D4D03AQFx55pqSO84iQ/profile-displayphoto-shrink_400_400/profile-displayphoto-shrink_400_400/0/1686052384531?e=1744848000&v=beta&t=tWgn8APGyuJUBcQGhISzPmSAEisV0JPO_cTBD7A4RO0")
            ),
            Page(
                title: "More about Work",
                description: "The product my team is developing is an educational application - Finelo (how to invest?)",
                color: .purple,
                imageName: URL(string: "https://play-lh.googleusercontent.com/ZDPDWehDC2rC4J_ybtYha08QDJtjDBAAtJNLLx0TINgiZj4IiDnOtvD9faTdwmdpEg")
            ),
            Page(
                title: "Gaming Hobby",
                description: "In my free time, I really enjoy playing video games. My favorites include Cyberpunk 2077 and Elden Ring.",
                color: .green,
                imageName: URL(string: "https://yt3.googleusercontent.com/LNNs3oKwnUBT2UzjHhnfjVjwpIk85jv3bya5u80biOS5Wst24PhTR9Upb_3avEBet6dYU5KdNw=s900-c-k-c0x00ffffff-no-rj")
            ),
            Page(
                title: "Reading Hobby",
                description: "I love reading books. My favorites are Dune and TBATE (WebNovel).",
                color: .green,
                imageName: URL(string: "https://m.media-amazon.com/images/I/81SPzHO2nxL._UF1000,1000_QL80_.jpg")
            ),
            Page(
                title: "Why iOS?",
                description: "I enjoy challenging myself and have always wanted to explore iOS development to complement my skills.",
                color: .blue,
                imageName: nil
            ),
            Page(
                title: "Personal Goals",
                description: "I am focusing on my development as a software engineer, aiming to master both Android and iOS while deepening my knowledge in system design and critical thinking.",
                color: .blue,
                imageName: nil
            ),
        ]
    }
}

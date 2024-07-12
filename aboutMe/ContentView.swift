//
//  ContentView.swift
//  aboutMe
//
//  Created by Scholar on 7/11/24.
//

import SwiftUI

struct ContentView: View {
    @State var currentIndex = 0
    let images = ["anika1", "anika2", "anika3", "anika4", "anika5", "anika6", "anika7", "anika8"]
    
    var body: some View {
        ZStack {
            Color("mistyRoseColor")
                .ignoresSafeArea()
            
            VStack {
                Spacer()
                Image(images[currentIndex])
                    .resizable()
                    .scaledToFit()
                
                HStack {
                    // this loop creates circles for each of the images
                    // when the index of the picture matches the index the loop is on, that circle becomes a different color
                    ForEach(0 ..< images.count) { index in
                        Circle()
                            .fill(self.currentIndex == index ? Color("raisinBlackColor") : Color.brown)
                            .frame(width: 10, height:10)
                    }
                }
                
                Spacer()
                
                Text("Anika Prakash")
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(Color("raisinBlackColor"))
                    .padding(0.20)
                Text("My name is Anika and I am 14 years old. I live in Sammamish, Washington. In my free time, I like to crochet, watch rom-coms, and play the nyt games!")
                    .foregroundColor(Color("raisinBlackColor"))
                Spacer()
            }
            .padding()
            .onAppear {
                // uses Timers to get the photos to cycle
                Timer.scheduledTimer(withTimeInterval: 2, repeats: true) { timer in
                    if self.currentIndex + 1 == self.images.count{
                        self.currentIndex = 0
                    } else {
                        self.currentIndex += 1
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}


/*VStack {
 Image("anika1")
     .resizable()
     .scaledToFit()
     .padding(0.20)

}.padding()*/

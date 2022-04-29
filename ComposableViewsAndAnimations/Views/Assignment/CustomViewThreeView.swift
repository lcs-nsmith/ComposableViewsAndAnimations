//
//  CustomViewThreeView.swift
//  ComposableViewsAndAnimations
//
//  Created by Nathan Smith on 2022-04-28.
//

import SwiftUI
import UIKit

struct CustomViewThreeView: View {
    
    // Controls the height of the progress capsule
    @State var animationParameter: CGFloat = 0
    
    // Controls which level the progress capsule stops at
    @State var animationMultiplier: CGFloat = 2
    
    // Controls the speed of the animation
    @State var animationDuration: CGFloat = 0.5
    
    // Controls the superimposed rectangle for the second level ⭐︎⭐︎
    @State var twoStarOpacity: Bool = false
    
    // Controls the superimposed rectangle for the first level ⭐︎
    @State var oneStarOpacity: Bool = false
    
    var body: some View {
        VStack {
            HStack {
                VStack (alignment: .trailing) {
                    HStack {
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                    }
                    .offset(x: 20)
                    ZStack {
                        Capsule(style: .continuous)
                            .frame(width: 40, height: 260, alignment: .leading)
                        Capsule(style: .continuous)
                            .frame(width: 40 - 8, height: 260 - 8, alignment: .leading)
                            .foregroundColor(.white)
                        VStack {
                            Spacer()
                            Capsule(style: .continuous)
                                .frame(width: 40 - 8, height: animationParameter, alignment: .bottom)
                                .foregroundColor(.yellow)
                        }
                        .frame(width: 40 - 8, height: 260 - 8, alignment: .bottom)
                        Rectangle()
                            .frame(width: 40 - 8, height: 10, alignment: .center)
                            .offset(y: -37)
                            .foregroundColor(.yellow)
                            .opacity(twoStarOpacity ? 1.0 : 0.0)
                    }
                }
                VStack (alignment: .leading) {
                    Spacer(minLength: 280)
                    HStack {
                        Image(systemName: "star.fill")
                        Image(systemName: "star.fill")
                    }
                    Capsule()
                        .frame(width: 52, height: 4, alignment: .leading)
                    Spacer()
                    Image(systemName: "star.fill")
                    Capsule()
                        .frame(width: 24, height: 4, alignment: .leading)
                    Spacer(minLength: 260)
                }
            }
        }
        .onTapGesture {
            withAnimation(Animation.linear(duration: animationDuration)) {
                animationParameter = 84 * animationMultiplier
            }
            // makes sure the rectangle doesn't show up when bar is only going to ⭐︎
            if animationMultiplier > 1 {
                withAnimation(Animation.easeOut(duration: 0.0).delay(animationDuration)) {
                    twoStarOpacity = true
                }
            }
            withAnimation(Animation.easeOut(duration: 0.0).delay(animationDuration)) {
                oneStarOpacity = true
            }
        }
    }
}

struct CustomViewThreeView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomViewThreeView()
        }
    }
}

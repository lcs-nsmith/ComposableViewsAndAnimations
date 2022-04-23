//
//  ExerciseThreeView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI
import UIKit
import Foundation

struct ExerciseThreeView: View {
    
    // MARK: Stored properties
    
    // Controls whether this view is showing or not
    @Binding var showThisView: Bool
    
    // Controls what typeface the text is shown in
    @State private var typeFace: String = "Helvetica-Neue"
    
    // Whether to apply the animation
    @State private var useAnimation = true
    
    // How much to rotate the text
    @State private var rotationAmount = 0.0
    
    // Controls the scale of the text and the capsule
    @State var scaleFactor: CGFloat = 1.0
    
    // Controls the colour of the capsule
    @State var hue: Color = .white
    
    // Controls the red of the background colour
    @State var tone: Color = .white
    
    // Controls the trailing padding of the text and the capsule
    @State var trailingPaddingAmount: CGFloat = 0.0
    
    // Controls the top padding of the text and the capsule
    @State var topPaddingAmount: CGFloat = 0.0
    
    // Controls the leading padding of the text and the capsule
    @State var leadingPaddingAmount: CGFloat = 0.0
    
    // Controls the bottom padding of the text and the capsule
    @State var bottomPaddingAmount: CGFloat = 0.0
    
    // Controls the colour of the text
    @State var tint: Color = .black
    
    // Controls the opacity of capsule
    @State var capsuleOpacityController: CGFloat = 1.0
    
    // Controls the x axis offset of the text and the capsule
    @State var xAxisOffset: CGFloat = 0.0
    
    // Controls the y axis offset of the text and the capsule
    @State var yAxisOffset: CGFloat = 0.0
    
    // MARK: Computed properties
    // List all fonts available
    // NOTE: This is a very useful gist...
    //       https://gist.github.com/kristopherjohnson/c825cb97b1ad1fe0bc13d709986d0763
    private static let fontNames: [String] = {
        var names: [String] = []
        for familyName in UIFont.familyNames {
            names.append(contentsOf: UIFont.fontNames(forFamilyName: familyName))
        }
        return names.sorted()
    }()
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                Rectangle()
                    .frame(width: 9000000000, height: 9000000000)
                    .ignoresSafeArea()
                    .foregroundColor(tone)
                
                Capsule()
                    .frame(width: 300, height: 100)
                    .foregroundColor(hue)
                    .opacity(capsuleOpacityController)
                
                Text("""
Rivers cut through rock
because of consistency,
not power.
""")
                .font(.custom(typeFace, size: 20.0))
                .rotation3DEffect(.degrees(rotationAmount), axis: (x: 0, y: 1, z: 0))
                .foregroundColor(tint)
            }
            .offset(x: xAxisOffset, y: yAxisOffset)
            .padding(.leading, trailingPaddingAmount)
            .padding(.trailing, trailingPaddingAmount)
            .padding(.top, topPaddingAmount)
            .padding(.bottom, bottomPaddingAmount)
            .rotationEffect(.degrees(rotationAmount))
            .scaleEffect(scaleFactor)
            .onTapGesture {
                scaleFactor = .random(in: 0.5...1.5)
                hue = Color(hue: Double.random(in: 1...360) / 360.0,
                            saturation: 0.8,
                            brightness: 0.8)
                tint = Color(hue: Double.random(in: 1...360) / 360.0,
                             saturation: 0.8,
                             brightness: 0.8)
                tone = Color(hue: Double.random(in: 1...360) / 360.0,
                             saturation: 0.8,
                             brightness: 0.8)
                typeFace = IAExampleThreeView.fontNames.randomElement()!
                rotationAmount = .random(in: 0.0...180.0)
                capsuleOpacityController = .random(in: 0.5...1.0)
                withAnimation(.interpolatingSpring(mass: 1.42, stiffness: 3.0, damping: 2.23, initialVelocity: 5)) {
                    xAxisOffset = .random(in: 0.0...50.0)
                    yAxisOffset = .random(in: 0.0...50.0)
                    trailingPaddingAmount = .random(in: 0.0...43.0)
                    topPaddingAmount = .random(in: 0.0...222)
                    bottomPaddingAmount = .random(in: 0.0...222)
                    leadingPaddingAmount = .random(in: 0.0...43.0)
                }
            }
            .animation(.easeInOut(duration: 0.5))
            .navigationTitle("Exercise 3 - CHAOS")
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button("Done") {
                        hideView()
                    }
                }
            }
        }
    }
    
    
    // MARK: Functions
    
    // Makes this view go away
    func hideView() {
        showThisView = false
    }
}


struct ExerciseThreeView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseThreeView(showThisView: .constant(true))
    }
}

// MARK: Notes
// NOTE: Here are some neat examples to consider...
//       https://medium.com/better-programming/create-an-awesome-loading-state-using-swiftui-9815ff6abb80
//
// NOTE: You might be wondering, in what ways can a view be manipulated?
//       In other words, what state changes might be fun to animate?
//       To see options, scroll down to the "Transforming views" section of the web page given here...
//
// https://www.hackingwithswift.com/quick-start/swiftui

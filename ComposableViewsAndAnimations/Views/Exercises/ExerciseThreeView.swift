//
//  ExerciseThreeView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI
import UIKit

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
    
    @State var scaleFactor: CGFloat = 1.0
    
    @State var hue: Color = .black
    
    @State var trailingPaddingAmount: CGFloat = 0.0
    
    @State var topPaddingAmount: CGFloat = 0.0
    
    @State var leadingPaddingAmount: CGFloat = 0.0
    
    @State var bottomPaddingAmount: CGFloat = 0.0
    
    @State var tint: Color = .primary
    
    @State var opacityController: CGFloat = 1.0
    
    @State var xAxisOffset: CGFloat = 0.0
    
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
                
                Capsule()
                    .frame(width: 300, height: 100)
                    .foregroundColor(tint)
                    .opacity(opacityController)
                
                Text(typeFace)
                    .font(.custom(typeFace, size: 30.0))
                    .rotation3DEffect(.degrees(rotationAmount), axis: (x: 0, y: 1, z: 0))
                    .foregroundColor(tint)
                    .opacity(opacityController)
            }
            .offset(x: xAxisOffset, y: yAxisOffset)
            .padding(.leading, trailingPaddingAmount)
            .padding(.trailing, trailingPaddingAmount)
            .padding(.top, topPaddingAmount)
            .padding(.bottom, bottomPaddingAmount)
            .onTapGesture {
                withAnimation(.interpolatingSpring(mass: 0.9, stiffness: 3.0, damping: 2.23, initialVelocity: 5)) {
                    
                }
            }
            .navigationTitle("Exercise 3")
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

// NOTE: Here are some neat examples to consider...
//       https://medium.com/better-programming/create-an-awesome-loading-state-using-swiftui-9815ff6abb80
//
// NOTE: You might be wondering, in what ways can a view be manipulated?
//       In other words, what state changes might be fun to animate?
//       To see options, scroll down to the "Transforming views" section of the web page given here...
//
// https://www.hackingwithswift.com/quick-start/swiftui

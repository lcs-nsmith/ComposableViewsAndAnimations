//
//  ExerciseTwoView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI
import UIKit

struct ExerciseTwoView: View {
    
    // MARK: Stored properties
    
    // Controls whether this view is showing or not
    @Binding var showThisView: Bool
    
    // Whether to apply the animation
    @State private var useAnimation = true
    
    @State var tint: Color = .primary
    
    // MARK: Computed properties
    
    var body: some View {
        
        NavigationView {
            
            Image(systemName: "tortoise.fill")
                .resizable()
                .scaledToFit()
                .padding()
                .foregroundColor(tint)
                .onTapGesture {
                    withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 2.25, damping: 0.75, initialVelocity: 3.0)) {
                        tint = Color(hue: Double.random(in: 1...360) / 360.0,
                                     saturation: 0.8,
                                     brightness: 0.8)
                    }
                    
                }
                .navigationTitle("Exercise 2")
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

struct ExerciseTwoView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseTwoView(showThisView: .constant(true))
    }
}

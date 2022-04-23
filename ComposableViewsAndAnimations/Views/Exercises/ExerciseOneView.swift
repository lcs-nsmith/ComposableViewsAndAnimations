//
//  ExerciseOneView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI
import UIKit

struct ExerciseOneView: View {
    
    // MARK: Stored properties
    
    // Controls whether this view is showing or not
    @Binding var showThisView: Bool
    
    // Whether to apply the animation
    @State private var useAnimation = true
    
    @State var scaleFactor: CGFloat = 1.0
    
    @State var hue: Color = .black
    
    @State var trailingPaddingAmount: CGFloat = 0.0
    
    @State var topPaddingAmount: CGFloat = 0.0
    
    // MARK: Computed properties
    
    var body: some View {
        
        NavigationView {
            
            VStack {
                
                Circle()
                    .frame(width: 200, height: 200)
                    .foregroundColor(hue)
                
            }
            .scaleEffect(scaleFactor)
            .onTapGesture {
                scaleFactor = .random(in: 0.1...1.5)
                hue = Color(hue: Double.random(in: 1...360) / 360.0,
                            saturation: 0.8,
                            brightness: 0.8)
                trailingPaddingAmount = .random(in: 0.0...90.0)
                topPaddingAmount = .random(in: 0.0...435)
            }
            .padding(.trailing, trailingPaddingAmount)
            .padding(.top, topPaddingAmount)
            .animation(.easeInOut)
            .navigationTitle("Exercise 1")
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

struct ExerciseOneView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseOneView(showThisView: .constant(true))
    }
}

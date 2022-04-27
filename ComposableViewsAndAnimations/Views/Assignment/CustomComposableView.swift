//
//  CustomComposableView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-24.
//

import SwiftUI

struct CustomComposableView: View {
    // MARK: Stored Properties
    
    @State var groupOne: CGFloat = 0.0
    @State var groupOneOne: CGFloat = 0.0
    @State var groupTwo: CGFloat = 0.0
    @State var groupTwoTwo: CGFloat = 0.0
    @State var groupOneOpaque: Bool = false
    @State var groupTwoOpaque: Bool = true
    
    @State var sequenceCycleHorizontal: Bool = false
    
    @State var useAnimation: Bool = true
    
    let timer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
    
    // MARK: Computed Properties
    var body: some View {
        ZStack {
            
            // MARK: Group One
            Group {
                Circle()
                    .offset(x: 0.0, y: groupOne)
                Circle()
                    .offset(x: 0.0, y: groupOne * 2)
                Circle()
                    .offset(x: 0.0, y: groupOne * 3)
            }
            .foregroundColor(.blue)
            .scaleEffect(0.03)
            .opacity(groupOneOpaque ? 1.0 : 0.0)
            
            Group {
                Circle()
                    .offset(x: 0.0, y: groupOneOne)
                Circle()
                    .offset(x: 0.0, y: groupOneOne * 2)
                Circle()
                    
                    .offset(x: 0.0, y: groupOneOne * 3)
            }
            .foregroundColor(.blue)
            .scaleEffect(0.03)
            .opacity(groupOneOpaque ? 1.0 : 0.0)
            
            // MARK: Group Two
            Group {
                Circle()
                    .offset(x: groupTwo, y: 0.0)
                Circle()
                    .offset(x: groupTwo * 2, y: 0.0)
                
                Circle()
                    .offset(x: groupTwo * 3, y: 0.0)
            }
            .foregroundColor(.blue)
            .scaleEffect(0.03)
            .opacity(groupTwoOpaque ? 1.0 : 0.0)
 
            Group {
                Circle()
                    .offset(x: groupTwoTwo, y: 0.0)
                Circle()
                    .offset(x: groupTwoTwo * 2, y: 0.0)
                
                Circle()
                    .offset(x: groupTwoTwo * 3, y: 0.0)
            }
            .foregroundColor(.blue)
            .scaleEffect(0.03)
            .opacity(groupTwoOpaque ? 1.0 : 0.0)
            
            Toggle("Animate state change", isOn: $useAnimation)
                .padding()
                .offset(y: 250)
        }
        .onReceive(timer) { input in
            if sequenceCycleHorizontal == false // vertical
            {
                groupTwoOpaque = true
            } else if sequenceCycleHorizontal == true {
                groupOneOpaque = true
            }
            withAnimation(useAnimation ? Animation.easeIn(duration: 0.5).delay(0.0).repeatForever() : .none) {
                if sequenceCycleHorizontal == false // vertical
                {
                    groupOne = 430.0
                    groupOneOne = -430.0
                    
                } else if sequenceCycleHorizontal == true {
                    groupTwo = 430
                    groupTwoTwo = -430
                }
            }
            sequenceCycleHorizontal.toggle()
        }
    }
}
struct CustomComposableView_Previews: PreviewProvider {
    static var previews: some View {
        CustomComposableView()
    }
}

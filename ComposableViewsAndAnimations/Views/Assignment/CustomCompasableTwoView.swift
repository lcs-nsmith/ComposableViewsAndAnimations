//
//  CustomCompasableTwoView.swift
//  ComposableViewsAndAnimations
//
//  Created by Nathan Smith on 2022-04-27.
//

import SwiftUI

struct CustomCompasableTwoView: View {
    
    @State var input: Double = 05.0
    
    @State var animationOpacity: Bool = true
    
    var formattedinput: String {
        return String(format: "%.0f", input)
    }
    
    var body: some View {
        VStack {
            ZStack {
                Image(systemName: "star.circle.fill")
                    .resizable()
                    .foregroundColor(.yellow)
                    .frame(width: 35, height: 35)
                    .opacity(animationOpacity ? 1.0 : 0.0)
                    .offset(x: (input - 5) * 140 / 5, y: 0.0)
                
                HStack {
                    Text("00")
                    Slider(value: $input, in: 0.0...10.0, label: {
                        Text("Speed")
                    })
                    Text("10")
                }
                .padding(.horizontal)
            }
            
            Text("\(formattedinput)")
            
        }
    }
}

struct CustomCompasableTwoView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCompasableTwoView()
    }
}

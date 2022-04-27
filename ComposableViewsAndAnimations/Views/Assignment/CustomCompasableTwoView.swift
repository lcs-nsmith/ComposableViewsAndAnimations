//
//  CustomCompasableTwoView.swift
//  ComposableViewsAndAnimations
//
//  Created by Nathan Smith on 2022-04-27.
//

import SwiftUI

struct CustomCompasableTwoView: View {
    
    @State var input: Double = 30.0
    
    var formattedinput: String {
        return String(format: "%.0f", input)
    }
    
    var body: some View {
        VStack {
            Text("\(formattedinput)")
            
            HStack {
                Text("0")
                Slider(value: $input, in: 0.0...60.0, label: {
                    Text("Speed")
                })
                Text("60")
            }
            .padding(.horizontal)
        }
    }
}

struct CustomCompasableTwoView_Previews: PreviewProvider {
    static var previews: some View {
        CustomCompasableTwoView()
    }
}

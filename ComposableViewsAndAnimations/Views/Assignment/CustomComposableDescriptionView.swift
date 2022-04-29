//
//  CustomComposableDescriptionView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI

struct CustomComposableDescriptionView: View {
    
    // MARK: Stored properties
    
    @State var animationDuration: CGFloat = 0.1
    
    @State var stepLevelInput: String = "1"
    
    // MARK: Computed properties
    
    var stepInputFormatted: CGFloat {
        return Double(stepLevelInput) ?? 1.0
    }
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Group {
                
                Text("By: Nathan Smith")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                    .padding(.leading)
                
                Text("""
                    Just x:y loading animation.
                    """)
                .padding()
                
                Text ("Parameters")
                    .font(.title3)
                    .bold()
                    .padding()
                
                
                // I decided to not use a divder becuase It streches out the size of the Group
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 360, height: 1, alignment: .center)
                    .foregroundColor(.gray)
                    .padding(.leading)
                
                HStack {
                    Text("Stage Level:")
                        .frame(alignment: .trailing)
                        .padding(.leading)
                    ZStack {
                        Image(systemName: "square")
                            .resizable()
                            .frame(width: 20, height: 20)
                            .foregroundColor(.blue)
                        Picker(selection: $stepLevelInput, label: Text(""), content: {
                            Text("1").tag("1")
                            Text("2").tag("2")
                            Text("3").tag("3")
                        })
                        .pickerStyle(MenuPickerStyle())
                    }
                    RoundedRectangle(cornerRadius: 25)
                        .frame(width: 58, height: 1, alignment: .center)
                        .rotationEffect(.degrees(90.0))
                        .foregroundColor(.gray)
                    VStack {
                        Text("Animation Duration")
                        HStack {
                            Stepper("\(String(format:"%.1f",animationDuration))",value: $animationDuration, in: 0.1...0.5, step: 0.1)
                                .padding(.trailing)
                        }
                    }
                }
            }
            
            List {
                NavigationLink(destination: CustomViewThreeView(animationMultiplier: stepInputFormatted, animationDuration: animationDuration)) {
                    SimpleListItemView(title: "Staged Progress Meter",
                                       caption: "A brief description of my view")
                }
                .padding()
                .navigationTitle("Staged Progress Meter")
            }
        }
    }
}
struct CustomComposableDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomComposableDescriptionView()
        }
    }
}

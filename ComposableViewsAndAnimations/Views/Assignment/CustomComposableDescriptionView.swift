//
//  CustomComposableDescriptionView.swift
//  ComposableViewsAndAnimations
//
//  Created by Russell Gordon on 2021-02-23.
//

import SwiftUI

struct CustomComposableDescriptionView: View {
    
    // MARK: Stored properties
    @State private var input: String = ""
    
    // MARK: Computed properties
    
    var body: some View {
        
        VStack(alignment: .leading) {
            
            Group {
                
                Text("Staged Progress Meter")
                    .font(.title2)
                    .bold()
                    .padding(.top)
                
                Text("""
                    Just x:y loading animation.
                    """)
                
                Text ("Parameters")
                    .font(.title3)
                    .bold()
                
                TextField("Enter an Colour", text: $input)
                
            }
            .padding(.bottom)
            
            List {
                NavigationLink(destination: CustomComposableView()) {
                    SimpleListItemView(title: "My Composable View",
                                       caption: "A brief description of my view")
                }
                    
                NavigationLink(destination: CustomCompasableTwoView()) {
                        SimpleListItemView(title: "SliderView",
                                           caption: "A brief description of my view")
                }
                NavigationLink(destination: CustomCompasableTwoView()) {
                        SimpleListItemView(title: "Staged Progress Meter ",
                                           caption: "A brief description of my view")
                }
            }
            
        }
        .padding()
        .navigationTitle("My Composable View")
        
    }
}

struct CustomComposableDescriptionView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            CustomComposableDescriptionView()
        }
    }
}

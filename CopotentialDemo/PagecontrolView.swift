//
//  PagecontrolView.swift
//  CopotentialDemo
//
//  Created by Vivek Patel on 06/10/20.
//

import SwiftUI

// MARK: Primary View
struct PageTabView: View {
    var body: some View {
        TabView {
            ForEach(0..<2) { index in
                if index == 0 {
                    DialView()
                }else {
                    SliderView()
                }
            }
        }.tabViewStyle(PageTabViewStyle())
        
    }
}

//
//  SliderView.swift
//  CopotentialDemo
//
//  Created by Vivek Patel on 08/10/20.
//

import SwiftUI

struct SliderView: View {
    @State private var number:Float = 0.0
    @State private var showDisplay = false
    var body: some View {
        GeometryReader { fullView in
            VStack(alignment: .center){
                Spacer()
                HStack(spacing: -60) {
                    Spacer()
                    VStack(alignment: .trailing, spacing: 10) {
                        ForEach((1...10).reversed(), id: \.self) {
                            Text("\($0)")
                                .bold()
                        }
                    }.frame(height: 300)
                    Slider(value: $number, in: 1...10, step: 1)
                        .rotationEffect(Angle(degrees: -90))
                        .frame(width: 300)
                }
                Text("\(number.clean)")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                NavigationLink( destination: ImagePickerView(),isActive: $showDisplay) {
                    Button(action: {
                        self.showDisplay = true
                    }) {
                        Text("Camera")
                            .bold()
                            .foregroundColor(.black)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color.white)
                    }.padding(.init(top: 8, leading: 0, bottom: 80, trailing: 0))
                }
                Spacer()
            }}.background(Color(.lightGray))
    }
}

struct SliderView_Previews: PreviewProvider {
    static var previews: some View {
        SliderView()
    }
}

// MARK: - Utility Extension
extension Float {
    var clean: String {
        return self.truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

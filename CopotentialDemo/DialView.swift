//
//  DialView.swift
//  CopotentialDemo
//
//  Created by Vivek Patel on 08/10/20.
//

import SwiftUI

struct DialView: View {
    @State private var numberLabel = "1"
    @State private var rotateState: Double = 0
    var body: some View {
        ZStack{
            Color(.lightGray)
            VStack{
                Text("")
                    .frame(width: 5, height: 20, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                    .background(Color(.black))
                Image("dial")
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 250, height: 250)
                    .rotationEffect(Angle(degrees: self.rotateState))
                    .gesture(RotationGesture()
                                .onChanged { value in
                                    self.rotateState = value.degrees
                                    if self.rotateState == 0 {
                                        numberLabel = "1"
                                    } else if self.rotateState >= -36 && self.rotateState <= 0 {
                                        numberLabel = "1"
                                    } else if self.rotateState >= -72 && self.rotateState <= -36 {
                                        numberLabel = "2"
                                    } else if self.rotateState >= -108 && self.rotateState <= -72 {
                                        numberLabel = "3"
                                    } else if self.rotateState >= -144 && self.rotateState <= -108 {
                                        numberLabel = "4"
                                    } else if self.rotateState >= -180 && self.rotateState <= -144 {
                                        numberLabel = "5"
                                    } else if self.rotateState >= -216 && self.rotateState <= -180 {
                                        numberLabel = "6"
                                    } else if self.rotateState >= -252 && self.rotateState <= -216 {
                                        numberLabel = "7"
                                    } else if self.rotateState >= -288 && self.rotateState <= -252 {
                                        numberLabel = "8"
                                    } else if self.rotateState >= -324 && self.rotateState <= -288 {
                                        numberLabel = "9"
                                    } else if self.rotateState >= -359 && self.rotateState <= -324 {
                                        numberLabel = "10"
                                    } else if self.rotateState >= 0 && self.rotateState >= 36 {
                                        numberLabel = "1"
                                    } else if self.rotateState >= 36 && self.rotateState <= 72 {
                                        numberLabel = "10"
                                    } else if self.rotateState >= 72 && self.rotateState <= 108 {
                                        numberLabel = "9"
                                    } else if self.rotateState >= 108 && self.rotateState <= 144 {
                                        numberLabel = "8"
                                    } else if self.rotateState >= 144 && self.rotateState <= 180 {
                                        numberLabel = "7"
                                    } else if self.rotateState >= 180 && self.rotateState <= 216 {
                                        numberLabel = "6"
                                    } else if self.rotateState >= 216 && self.rotateState <= 252 {
                                        numberLabel = "5"
                                    } else if self.rotateState >= 252 && self.rotateState <= 288 {
                                        numberLabel = "4"
                                    } else if self.rotateState >= 288 && self.rotateState <= 324 {
                                        numberLabel = "3"
                                    } else if self.rotateState >= 324 && self.rotateState <= 360 {
                                        numberLabel = "2"
                                    } else if self.rotateState == 360{
                                        numberLabel = "10"
                                    }
                                }
                    )
                Text(numberLabel)
                    .font(.title)
                    .bold()
            }
        }
    }
    private func changeTheStateOfLabelFromDial() {
        
    }
}

struct DialView_Previews: PreviewProvider {
    static var previews: some View {
        DialView()
    }
}

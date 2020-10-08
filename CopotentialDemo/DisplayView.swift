//
//  DisplayView.swift
//  CopotentialDemo
//
//  Created by Vivek Patel on 04/10/20.
//

import SwiftUI

struct DisplayView: View {

    // MARK: - Variables
    @State private var showDisplay = false
    @ObservedObject var session = FirebaseSession()
    @Environment(\.presentationMode) var presentationMode
  
    // MARK: - Body
    var body: some View {
        GeometryReader { geometry in
            VStack{
                ZStack{
                    Text("")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: UIScreen.main.bounds.height/2)
                        .background(LinearGradient(gradient: Gradient(colors: [.yellow, .white, .blue]), startPoint: .top, endPoint: .bottom))
                        .edgesIgnoringSafeArea(.all)
                    VStack{
                        Text("\(session.items.last?.name ?? "n/a")")
                            .fontWeight(.semibold)
                            .padding(.vertical,40)
                        Text("\(session.items.last?.email ?? "n/a")")
                            .fontWeight(.semibold)
                    }
                }
                .frame(height:  geometry.size.height / 2)
                HStack{
                    NavigationLink( destination: DisplayView())
                    {
                        Button(action: {
                            dismiss()
                        }) {Text("Back")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color.gray)
                        }
                    }
                    NavigationLink( destination: PageTabView(),isActive: $showDisplay)
                    {
                        Button(action: {
                            print("tapped")
                            self.showDisplay = true
                        }) {Text("Next")
                            .bold()
                            .foregroundColor(.white)
                            .padding(.horizontal, 20)
                            .padding(.vertical, 10)
                            .background(Color.gray)
                        }
                    }
                }
            }.onAppear(){
                session.getData()
            }
        }.navigationBarHidden(true)
    }
    
    func dismiss() {
        presentationMode.wrappedValue.dismiss()
    }
}

struct DisplayView_Previews: PreviewProvider {
    static var previews: some View {
        DisplayView()
    }
}

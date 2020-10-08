//
//  ImagePickerView.swift
//  CopotentialDemo
//
//  Created by Vivek Patel on 07/10/20.
//

import SwiftUI

struct ImagePickerView: View {
    // MARK: - Variables
    @State private var showSheet: Bool = false
    @State private var showImagePicker: Bool = false
    @State private var sourceType: UIImagePickerController.SourceType = .camera
    @State private var image: UIImage?
    // MARK: - Body
    var body: some View {
        VStack {
            Image(uiImage: image ?? UIImage(named: "placeholder")!)
                .resizable()
                .frame(width: 300, height: 300)
            
            Button("Choose Picture") {
                self.showSheet = true
            }.padding()
            .actionSheet(isPresented: $showSheet) {
                ActionSheet(title: Text("Select Photo"), message: Text("Choose"), buttons: [
                    .default(Text("Photo Library")) {
                        self.showImagePicker = true
                        self.sourceType = .photoLibrary
                    },
                    .default(Text("Camera")) {
                        self.showImagePicker = true
                        self.sourceType = .camera
                    },
                    .cancel()
                ])
            }
        }
        .sheet(isPresented: $showImagePicker) {
            ImagePicker(image: self.$image, isShown: self.$showImagePicker, sourceType: self.sourceType)
        }
        .onAppear(){
            //self.showImagePicker = true
            //self.sourceType = .camera
        }
    }
    
    struct ImagePickerView_Previews: PreviewProvider {
        static var previews: some View {
            ImagePickerView()
        }
    }
}

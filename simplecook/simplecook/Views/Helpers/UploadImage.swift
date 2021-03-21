//
//  UploadImage.swift
//  simplecook
//
//  Created by Conor Thorne on 08/03/2021.
//

import SwiftUI

struct UploadImage: View {
    
    @State public var image: Image?
    @State private var showingImagePicker = false
    @State private var inputImage : UIImage?
    
    var body: some View {
        NavigationView {
            VStack {
                ZStack{
                    Rectangle()
                        .fill(Color.secondary)
                        .frame(width:200, height:200)
                    
                    // display image
                    if image != nil {
                        image?
                            .resizable()
                            .frame(width:200, height:200)
                    } else {
                        Text("select a recipe image")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                }
                
                // user selects an image
                .onTapGesture {
                    self.showingImagePicker = true  // show user image picker
                }
                
            }
            .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                ImagePicker(image: self.$inputImage)
            }
        }
        .offset(y:-40)
        .frame(width:220,height:300)
        .border(Color.black)
    }
    
    func loadImage() {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct UploadImage_Previews: PreviewProvider {
    static var previews: some View {
        UploadImage()
    }
}

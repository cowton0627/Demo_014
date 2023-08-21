//
//  ContentView.swift
//  Demo_014
//
//  Created by 鄭淳澧 on 2021/7/25.
//

import SwiftUI
import UIKit


struct ContentView: View {
    
    @State private var isShowPhotoLibrary = false
    @State private var image = UIImage()


    var body: some View {
        
        VStack {

            Image(uiImage: self.image)
                .resizable()
                .scaledToFit()
//                .frame(minWidth: 0, maxWidth: .infinity)
//                .edgesIgnoringSafeArea(.all)
                .padding()

            Button(action: {
                self.isShowPhotoLibrary = true
            }) {
                HStack {
                    Image(systemName: "photo")
                        .font(.system(size: 20))
                    
                    Text("Photo Picker")
                        .font(.headline)
                }
                .frame(minWidth: 0,
                       maxWidth: .infinity,
                       minHeight: 0,
                       maxHeight: 50)
                .background(Color.blue)
                .foregroundColor(.orange)
                .cornerRadius(20)
                .padding(.horizontal)
            }
        }
        .sheet(isPresented: $isShowPhotoLibrary) {
            
            ImagePicker(selectedImage: self.$image)
//            ImagePicker(selectedImage: self.$image,
//                        sourceType: .camera)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

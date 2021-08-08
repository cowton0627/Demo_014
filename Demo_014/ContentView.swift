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
//            Text("Hello, world!")
//                .padding()
            Image(uiImage: self.image)
                .resizable()
                .scaledToFit()
                .frame(minWidth: 0, maxWidth: .infinity)
                .edgesIgnoringSafeArea(.all)

            
            Button(action: {
                self.isShowPhotoLibrary = true
            }) {
                HStack {
                    Image(systemName: "photo")
                        .font(.system(size: 20))
                    
                    Text("Photo picker")
                        .font(.headline)
                    
                }
                .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 50)
                .background(Color.blue)
                .foregroundColor(.primary)
                .cornerRadius(20)
                .padding(.horizontal)
            }
        }
        .sheet(isPresented: $isShowPhotoLibrary) {
            ImagePicker(selectedImage: self.$image, sourceType: .photoLibrary)
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

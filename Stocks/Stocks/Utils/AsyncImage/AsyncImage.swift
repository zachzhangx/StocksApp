//
//  AsyncImage.swift
//  Stocks
//
//  Created by Zhang Xu on 2022/3/22.
//

import SwiftUI

struct AsyncImage<PlaceholderView:View>: View{
    @StateObject private var loader: ImageLoader
    
    private let placeholder: PlaceholderView
    private let image: (UIImage) -> Image
    
    init(url:URL,@ViewBuilder placeholder: () -> PlaceholderView,
        @ViewBuilder image: @escaping (UIImage) -> Image = Image.init(uiImage:)){ //In closure, view accepting multiple subviews as input
        self.placeholder = placeholder()
        self.image = image
        _loader = StateObject(wrappedValue: ImageLoader(url: url, cache: Environment(\.imageCache) as? ImageCache))
    }
    
    private var content: some View{
        Group{ //Collects multiple instances into a single unit
            if loader.image != nil{
                image(loader.image!)
            }else{
                placeholder
            }
        }
    }
    
    var body: some View{
        content.onAppear(perform: loader.load)
    }
}

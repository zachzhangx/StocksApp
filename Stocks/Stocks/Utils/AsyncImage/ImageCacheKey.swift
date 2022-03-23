//
//  ImageCacheKey.swift
//  Stocks
//
//  Created by Zhang Xu on 2022/3/22.
//

import SwiftUI

struct ImageCacheKey: EnvironmentKey {
    static let defaultValue: ImageCache = TemporaryImageCache()
}

extension EnvironmentValues{
    var imageCache: ImageCache{
        get{ self[ImageCacheKey.self] }
        set{ self[ImageCacheKey.self] = newValue }
    }
}

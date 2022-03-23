//
//  ImageCache.swift
//  Stocks
//
//  Created by Zhang Xu on 2022/3/22.
//

import Foundation
import UIKit

protocol ImageCache{
    subscript(_ url: URL) -> UIImage? {get set}
}

struct TemporaryImageCache: ImageCache {
    private let cache: NSCache<NSURL, UIImage> = {
       let cache = NSCache<NSURL, UIImage>()
        cache.countLimit = 100
        cache.totalCostLimit = 1024 * 1024 * 100
        return cache
    }()
    
    subscript(_ key: URL) -> UIImage? {
        get{
            cache.object(forKey: key as NSURL)
        }
        set{
            newValue == nil ? cache.removeObject(forKey: key as NSURL) :
            cache.setObject(newValue!, forKey: key as NSURL)
        }
    }
}

//
//  News.swift
//  Stocks
//
//  Created by Zhang Xu on 2022/3/22.
//

import Foundation

struct News: Identifiable, Codable{
    var id: UUID {
        return UUID()
    }
    var title: String
    var url: String
    var urlToImage: String?
    var imageUrl: String{ //optional urlToImage, show default image if it's nil
        return urlToImage?.replacingOccurrences(of: "http://", with: "https://") ??
                "https://icon-library.com/images/placeholder-image-icon/placeholder-image-icon-19.jpg"
    }
}

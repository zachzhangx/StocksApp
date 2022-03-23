//
//  GlobalQuote.swift
//  Stocks
//
//  Created by Zhang Xu on 2022/3/21.
//

import Foundation

struct GlobalQuoteResponse: Codable{
    var quote: Quote
    
    private enum CodingKeys: String, CodingKey{
        case quote = "Global Quote"
    }
}

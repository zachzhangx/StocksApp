//
//  API.swift
//  Stocks
//
//  Created by Zhang Xu on 2022/3/21.
//

import Foundation

struct API {
    
    static var apiKey: String{
        return "6SSENNGZ2IWABR8Z"
    }
    
    static var baseUrl: String{
        return "https://www.alphavantage.co/query?"
    }
    
    enum SymbolFunction: String{
        case search = "SYMBOL_SEARCH"
        case quote = "GLOBAL_QUOTE"
    }
    
    static func symbolSearchUrl(for searchKey: String) -> String{
        return urlBy(symbol: .search, searchKey: searchKey)
    }
    
    static func quoteUrl(for searchKey: String) -> String{
        return urlBy(symbol: .quote, searchKey: searchKey)
    }
    
    static func urlBy(symbol: SymbolFunction, searchKey: String) -> String{
        switch symbol {
        case .search:
            return "\(baseUrl)function=\(symbol.rawValue)&keywords=\(searchKey)&apikey=\(apiKey)"
        case .quote:
            return "\(baseUrl)function=\(symbol.rawValue)&symbol=\(searchKey)&apikey=\(apiKey)"
        }
    }
    
}

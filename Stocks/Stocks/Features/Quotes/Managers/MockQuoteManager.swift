//
//  MockQuoteManager.swift
//  Stocks
//
//  Created by Zhang Xu on 2022/3/21.
//

import Foundation

final class MockQuoteManager: QuoteManagerProtocol, ObservableObject{
    @Published var quotes: [Quote] = []
    
    func download(stocks: [String], completion: @escaping (Result<[Quote], NetworkError>) -> Void) {
        let aapl = Quote(symbol: "AAPL", open: "135.9", high: "136.39", low: "133.77", price: "135.13", change: "-0.26", changePercent: "-0.19%")
        let goog = Quote(symbol: "GOOG", open: "2099.51", high: "2102.13", low: "2077.32", price: "2095.89", change: "0.51", changePercent: "0.024%")
        
        for _ in 0..<8{
            quotes.append(contentsOf: [aapl, goog]) //16 elements in quotes
        }
    }
}


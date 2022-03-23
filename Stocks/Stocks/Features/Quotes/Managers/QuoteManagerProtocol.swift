//
//  QuoteManagerProtocol.swift
//  Stocks
//
//  Created by Zhang Xu on 2022/3/21.
//

import Foundation

protocol QuoteManagerProtocol{
    var quotes: [Quote] {get set}
    
    //define a Delegate function
    func download(stocks:[String], completion: @escaping (Result<[Quote], NetworkError>) -> Void)
}

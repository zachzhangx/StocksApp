//
//  SearchManager.swift
//  Stocks
//
//  Created by Zhang Xu on 2022/3/23.
//

import Foundation

final class SearchManager: ObservableObject {
    @Published var searches = [Search]()
    
    func searchStocks(keyword: String){
        NetworkManager<SearchResponse>().fetch(from: URL(string: API.symbolSearchUrl(for: keyword))!){ (result) in
            switch result{
            case .failure(let err):
                print(err)
            case .success(let resp):
                DispatchQueue.main.async {
                    self.searches = resp.bestMatches
                }
            }
        }
    }
}

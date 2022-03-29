//
//  NetworkManager.swift
//  Stocks
//
//  Created by Zhang Xu on 2022/3/18.
//

import Foundation
import SwiftUI

class NetworkManager <T: Codable>{
    func fetch(from url: URL, completion: @escaping (Result<T, NetworkError>) -> Void) { //Closure返回, Result<T, NetworkError>表示成功和失败二选一， T:generic type
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard error == nil else{
                completion(.failure(.error(err: error!.localizedDescription)))
                return
            }
            
            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else{
                completion(.failure(.invalidResponse(response: response!.description)))
                return
            }
            guard let data = data else{
                completion(.failure(.invalidData))
                return
            }
            
            do{
                let json = try JSONDecoder().decode(T.self, from: data)
                completion(.success(json))
            }catch let err{
                completion(.failure(.decondingError(err: err.localizedDescription)))
                print(err)
            }
        }.resume()
    }
}

enum NetworkError: Error{ //define different errors
    case error(err: String)
    case invalidResponse(response: String)
    case invalidData
    case decondingError(err: String)
}

//
//  UserDefaultsManager.swift
//  Stocks
//
//  Created by Zhang Xu on 2022/3/23.
//

import Foundation

final class UserDefaultsManager{
    
    private static let symbolKey = "SYMBOL_KEY"
    
    var savedSymbols = [String]()
    
    static let shared = UserDefaultsManager() //Singletion
    
    private init(){
        get()
    }
    
    func get(){
        if let saved = UserDefaults.standard.array(forKey: Self.symbolKey) as? [String] {
            savedSymbols = saved
        }
    }
    
    func set(symbol: String){
        savedSymbols.append(symbol)
        UserDefaults.standard.set(self.savedSymbols, forKey: Self.symbolKey)
    }
}

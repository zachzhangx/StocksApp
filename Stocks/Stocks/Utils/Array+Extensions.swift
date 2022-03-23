//
//  Array+Extensions.swift
//  Stocks
//
//  Created by Zhang Xu on 2022/3/23.
//

import Foundation

extension Array where Element: Hashable {
    func difference(from other: [Element]) -> [Element]{
        let thisSet = Set(self)
        let otherSet = Set(other)
        return Array(thisSet.symmetricDifference(otherSet))//除去两个Set中的相同元素，保留不同的元素为新Array
    }
}

//
//  Array+Identifiable.swift
//  Practice
//
//  Created by 임은지 on 2021/02/24.
//

import Foundation

extension Array where Element: Identifiable {
    func firstIndex(matching: Element) -> Int? {
        for index in 0..<self.count {
            if self[index].id == matching.id {
                return index
            }
        }
        return  nil
    }
}

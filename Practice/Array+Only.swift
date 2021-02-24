//
//  Array+Only.swift
//  Practice
//
//  Created by 임은지 on 2021/02/25.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first: nil
    }
}

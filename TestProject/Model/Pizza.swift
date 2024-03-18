//
//  Pizza.swift
//  TestProject
//
//  Created by Giuseppe Sapienza on 16/2/2024.
//

import Foundation

struct Pizza: Hashable, Identifiable {
    let id = UUID()
    var name: String
    var price: Decimal
}

//
//  PizzaDetailsView.swift
//  TestProject
//
//  Created by Giuseppe Sapienza on 16/3/2024.
//

import SwiftUI

struct PizzaDetailsView: View {
    
    let pizza: Pizza
    
    var body: some View {
        List {
            HStack {
                Text("Price")
                Spacer()
                Text(pizza.price, format: .currency(code: "EUR"))
            }
        }
        .navigationTitle(pizza.name)
    }
}

#Preview {
    NavigationStack {
        PizzaDetailsView(pizza: Pizza(name: "Margherita", price: 4.99))
    }
}

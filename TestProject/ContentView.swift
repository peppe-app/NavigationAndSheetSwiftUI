//
//  ContentView.swift
//  TestProject
//

import SwiftUI

struct ContentView: View {
    
    @State private var pizzas = [
        Pizza(name: "Margherita", price: 6.0),
        Pizza(name: "Porcini", price: 12.0),
        Pizza(name: "Marinara", price: 4)
    ]
    
    @State private var path = NavigationPath()
    @State private var addPizza: Bool = false
    
    var body: some View {
        NavigationStack(path: $path) {
            List {
                ForEach(pizzas) { pizza in
                    NavigationLink(pizza.name, value: pizza)
                }
            }
            .sheet(isPresented: $addPizza, content: {
                EditPizzaView { pizza in
                    pizzas.append(pizza)
                }
                .presentationDetents([.medium, .fraction(0.3)])
            })
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button("Add") {
                        addPizza.toggle()
                    }
                }
                ToolbarItem(placement: .primaryAction) {
                    Button("Random", action: showRandomPizza)
                }
            }
            .navigationTitle("Home")
            .navigationDestination(for: Pizza.self) { pizza in
                PizzaDetailsView(pizza: pizza)
            }
        }
    }
    
    private func showRandomPizza() {
        guard let randomPizza = pizzas.randomElement() else { return }
        path.append(randomPizza)
    }
}

#Preview {
    ContentView()
}

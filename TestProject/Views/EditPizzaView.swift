//
//  EditPizzaView.swift
//  TestProject
//
//  Created by Giuseppe Sapienza on 17/3/2024.
//

import SwiftUI

struct EditPizzaView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    let onSave: (Pizza) -> ()
    
    @State private var pizza = Pizza(name: "", price: 0)
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $pizza.name)
                
                TextField(
                    value: $pizza.price,
                    format: .number,
                    label: {
                        Text("Price")
                    }
                )
            }
            .navigationTitle("New Pizza")
            .toolbar {
                Button {
                    onSave(pizza)
                    dismiss()
                } label: {
                    Text("Add Pizza")
                }
                .disabled(
                    pizza.name.isEmpty == true
                    || pizza.price <= 0
                )
            }
        }
    }
}

#Preview {
    EditPizzaView { pizza in
        
    }
}

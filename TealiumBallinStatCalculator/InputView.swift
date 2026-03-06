//
//  InputView.swift
//  TealiumBallinStatCalculator
//
//  Created by Alex on 3/4/26.
//

import SwiftUI

struct InputRow: View {
    
    let title: String
    @Binding var value: Int
    let field: StatField
    
    @Environment(\.focusedStatField) var focusedField
    
    var body: some View {
        HStack {
            
            Text(title)
                .frame(width: 60, alignment: .leading)
            
            Spacer()
            
            Button {
                if value > 0 { value -= 1 }
            } label: {
                Image(systemName: "minus.circle")
                    .font(.title2)
            }
            
            TextField(
                "",
                text: Binding(
                    get: { String(value) },
                    set: { value = Int($0) ?? 0 }
                )
            )
            .keyboardType(.numberPad)
            .multilineTextAlignment(.center)
            .frame(width: 60)
            .textFieldStyle(.roundedBorder)
            .focused(focusedField!, equals: field) // TODO: - unwrap
            .onChange(of: focusedField?.wrappedValue) { newField in
                if newField == field {
                    DispatchQueue.main.async {
                        UIApplication.shared.sendAction(
                            #selector(UIResponder.selectAll(_:)),
                            to: nil,
                            from: nil,
                            for: nil
                        )
                    }
                }
            }
            
            Button {
                value += 1
            } label: {
                Image(systemName: "plus.circle")
                    .font(.title2)
            }
        }
    }
}

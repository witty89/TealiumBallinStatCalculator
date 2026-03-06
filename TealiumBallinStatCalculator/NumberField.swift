//
//  NumberField.swift
//  TealiumBallinStatCalculator
//
//  Created by Alex on 3/4/26.
//

import SwiftUI

struct SelectableNumberField: UIViewRepresentable {
    
    @Binding var value: Int
    @Binding var isFocused: Bool
    
    func makeUIView(context: Context) -> UITextField {
        let textField = UITextField()
        
        textField.keyboardType = .numberPad
        textField.textAlignment = .center
        textField.borderStyle = .roundedRect
        textField.delegate = context.coordinator
        
        return textField
    }
    
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = "\(value)"
        
        if isFocused && !uiView.isFirstResponder {
            uiView.becomeFirstResponder()
        }
        
        if !isFocused && uiView.isFirstResponder {
            uiView.resignFirstResponder()
        }
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        var parent: SelectableNumberField
        
        init(_ parent: SelectableNumberField) {
            self.parent = parent
        }
        
        func textFieldDidBeginEditing(_ textField: UITextField) {
            parent.isFocused = true
            
            DispatchQueue.main.async {
                textField.selectAll(nil)
            }
        }
        
        func textFieldDidEndEditing(_ textField: UITextField) {
            parent.isFocused = false
            
            if let text = textField.text,
               let intValue = Int(text) {
                parent.value = intValue
            }
        }
    }
}

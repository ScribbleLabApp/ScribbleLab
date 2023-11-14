//
//  OTPTextFieldView.swift
//  ScribbleLab
//
//  Created by Nevio Hirani on 14.11.23.
//

import SwiftUI

struct OTPTextFieldView: View {
    
    let numberOfFields: Int
    
    @State var enterValue: [String]
    @FocusState private var fieldFocus: Int?
    @State private var oldValue = ""
    
    init(numberOfFields: Int) {
        self.numberOfFields = numberOfFields
        self.enterValue = Array(repeating: "", count: numberOfFields)
    }
    
    var body: some View {
        HStack {
            ForEach(0 ..< numberOfFields, id: \.self) { index in
                TextField("", text: $enterValue[index], onEditingChanged: { editing in
                    if editing {
                        oldValue = enterValue[index]
                    }
                })
                    .keyboardType(.numberPad)
                    .frame(width: 48, height: 48)
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                        .strokeBorder(Color(red: 194/255, green: 194/255, blue: 194/255), lineWidth: 0.5)
                        Color.gray.opacity(0.02)
                    }
                    .multilineTextAlignment(.center)
                    .focused($fieldFocus, equals: index)
                    .tag(index)
                    .onChange(of: enterValue[index]) { newValue in
                        if enterValue[index].count > 1 {
                            let currentValue = Array(enterValue[index])
                            
                            if currentValue[0] == Character(oldValue) {
                                enterValue[index] = String(enterValue[index].suffix(1))
                            } else {
                                enterValue[index] = String(enterValue[index].prefix(1))
                            }
                        }
                        
                        if !newValue.isEmpty {
                            if index == numberOfFields - 1 {
                                fieldFocus = nil
                            } else {
                                fieldFocus = (fieldFocus ?? 0) + 1
                            }
                        } else {
                            fieldFocus = (fieldFocus ?? 0) - 1
                        }
                    }
            }
        }
    }
}

#Preview {
    OTPTextFieldView(numberOfFields: 6)
}

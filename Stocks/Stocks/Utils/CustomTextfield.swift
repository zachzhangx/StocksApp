//
//  CustomTextfield.swift
//  Stocks
//
//  Created by Zhang Xu on 2022/3/21.
//

import SwiftUI

struct CustomTextfield: View {
    
    var placeHolder: Text
    
    @Binding var text:String
    
    var editingChanged: (Bool) -> Void = { _ in}
    
    var commit: () -> Void = {}
    
    var body: some View {
        ZStack(alignment: .leading) {
            if text.isEmpty {placeHolder}
            TextField("", text: $text, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}


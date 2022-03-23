//
//  SearchTextView.swift
//  Stocks
//
//  Created by Zhang Xu on 2022/3/21.
//

import SwiftUI

struct SearchTextView: View {
    
    @Binding var searchTerm: String
    
    var body: some View {
        CustomTextfield(placeHolder: Text("Search").foregroundColor(.gray), text: $searchTerm)
            .foregroundColor(.white)
            .padding(.leading, 40)
            .frame(height:40)
            .background(
                ZStack(alignment: .leading){
                RoundedRectangle(cornerRadius:10)
                        .fill(Color.gray.opacity(0.3))
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                    .padding(.leading, 10)
                }
            )
            .padding(5)
    }
}

struct SearchTextView_Previews: PreviewProvider {
    static var previews: some View {
        SearchTextView(searchTerm: .constant(""))
    }
}

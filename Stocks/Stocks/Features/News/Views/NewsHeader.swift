//
//  NewsHeader.swift
//  Stocks
//
//  Created by Zhang Xu on 2022/3/22.
//

import SwiftUI

struct NewsHeader: View {
    var body: some View {
        VStack(alignment:.leading){
            Text("Top News")
                .font(.title)
                .foregroundColor(.white)
            
            HStack(spacing:2){
                Text("From")
                Image(systemName: "applelogo")
                Text("NewsAPI")
            }
            .font(.title2)
            .foregroundColor(.gray)
            
            RoundedRectangle(cornerRadius: 2) //Underline
                .fill(Color.gray)
                .frame(height:1)
        }
    }
}

struct NewsHeader_Previews: PreviewProvider {
    static var previews: some View {
        NewsHeader()
    }
}

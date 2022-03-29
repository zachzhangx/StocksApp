//
//  MiniQuoteView.swift
//  Stocks
//
//  Created by Zhang Xu on 2022/3/21.
//

import SwiftUI

struct MiniQuoteView: View {
    
    @ObservedObject var stockQuotes: StockQuoteManager
        //MockQuoteManager
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                //quotes array in StackQuoteManager
                ForEach(stockQuotes.quotes){//缩小的Quote
                    quote in
                    VStack{
                        Text(quote.symbol)
                            .font(.subheadline)
                            .bold()
                        Text(quote.price)
                            .font(.subheadline)
                        Text(quote.change)
                            .font(.subheadline)
                            .padding(.horizontal)
                            .frame(width: 100)
                            .background(RoundedRectangle(cornerRadius: 5)
                                .fill(Double(quote.change)! > 0.0 ? Color.green : Color.red),alignment:.trailing)
                    }.background(RoundedRectangle(cornerRadius:10).fill(Color.white.opacity(0.4)))
                    .foregroundColor(.white)
                }
            }
        }
        .onAppear {
            stockQuotes.download(stocks: [], completion: { _ in })
        }
    }
}

struct MiniQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        MiniQuoteView(stockQuotes: StockQuoteManager())
    }
}

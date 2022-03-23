//
//  HeaderView.swift
//  Stocks
//
//  Created by Zhang Xu on 2022/3/21.
//

import SwiftUI

struct HeaderView: View {
    
    private let dateFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "MMMM dd"
        return formatter
    }()
    
    @Binding var stocks: [String]
    
    @State private var showSearch = false //存储此视图中的简单属性
    
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: -5){
                Text("Stocks")
                    .foregroundColor(.white)
                    .bold()
                Text("\(Date(), formatter: dateFormatter)")
                    .foregroundColor(.gray)
                    .bold()
            }.font(.title)
            
            Spacer()

            Button{
                showSearch.toggle()
            }label: {
                Image(systemName: "plus")
                    .font(.title)
                    .foregroundColor(.white)
            }.sheet(isPresented: $showSearch, onDismiss: {
                self.stocks = UserDefaultsManager.shared.savedSymbols
            }, content: {
                SearchView()
            })
            
        }.background(.black)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(stocks: .constant(["AAPL", "GOOG"]))
    }
}

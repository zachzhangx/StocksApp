//
//  NewsSheetView.swift
//  Stocks
//
//  Created by Zhang Xu on 2022/3/22.
//

import SwiftUI

struct NewsSheetView: View {
    
    @Binding var newsOpen: Bool
    @ObservedObject var newsManager: NewsDownloadManager
    
    init(newsOpen: Binding<Bool>, newsManager: NewsDownloadManager){
        UITableView.appearance().separatorStyle = .none
        UITableView.appearance().backgroundColor = .clear
        UITableViewCell.appearance().backgroundColor = .clear
        self._newsOpen = newsOpen
        self.newsManager = newsManager
    }
    
    var body: some View {
        BottomSheetView(isOPen: $newsOpen, maxHeight: UIScreen.main.bounds.height * 0.89){
            ZStack{
                Color.white
                Rectangle().fill(Color.black.opacity(0.8))
                
                VStack(alignment:.leading){
                    NewsHeader()
                    Spacer()
                    NewsListView(newsManager: newsManager)
                }.padding()
            }
        }.edgesIgnoringSafeArea(.vertical)
    }
}


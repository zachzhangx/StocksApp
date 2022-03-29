//
//  NewsListView.swift
//  Stocks
//
//  Created by Zhang Xu on 2022/3/22.
//

import SwiftUI
import BetterSafariView

struct NewsListView: View {
    
    @ObservedObject var newsManager: NewsDownloadManager
    @State private var showOnSafari = false
    @State private var selectedArticle: News?
    
    var body: some View {
        VStack{
            ScrollView(.vertical, showsIndicators: false){
                ForEach(newsManager.newsArticles) {article in
                    VStack(alignment: .leading){
                        HStack(alignment: .top){
                            VStack {
                                Spacer()
                                Text(article.title)
                                    .bold()
                                    .foregroundColor(.white)
                                    .fixedSize(horizontal: false, vertical: true)
                                //.background(Color.green)
                                Spacer()
                            }
                            Spacer()
                            AsyncImage.init(url: URL(string: article.imageUrl)!){
                                RoundedRectangle(cornerRadius: 10)
                                    .fill(Color.white.opacity(0.2))
                            }image: { (img) -> Image  in
                                Image(uiImage: img)
                                    .resizable()
                            }.scaledToFit()
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                            
                        }.contentShape(Rectangle())
                        .onTapGesture {
                            selectedArticle = article
                            showOnSafari.toggle()
                        }.sheet(isPresented: $showOnSafari, content: {
                            loadNews(for: selectedArticle  ?? article)
                        })

                        RoundedRectangle(cornerRadius: 10).fill(Color.white.opacity(0.2)) //Separator line
                            .padding(.horizontal, 50)
                            .frame(height: 1)
                    }
                }
            }
        }
    }
    
    private func loadNews(for article: News) -> some View {
        return SafariView(url: URL(string: article.url.replacingOccurrences(of: "http://", with: "https://"))!)
    }
}


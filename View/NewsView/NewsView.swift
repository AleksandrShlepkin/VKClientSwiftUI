//
//  NewsView.swift
//  VKClientSwiftUI
//
//  Created by Alex on 17.12.2021.
//

import SwiftUI


struct NewsView: View {
    @ObservedObject var news: NewsViewModel
    init(news: NewsViewModel) {
        self.news = news
        
    }
    
    var body: some View {
        List(news.news){ new in
            NewsList(newsGroup: new)
        }.onAppear{ news.newsGet()}
    }
}

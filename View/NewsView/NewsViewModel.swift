//
//  NewsViewModel.swift
//  VKClientSwiftUI
//
//  Created by Alex on 17.12.2021.
//

import SwiftUI

class NewsViewModel: ObservableObject {
    @Published var news: [Item] = []
    
    
    let api: GetNews
    
    init(_ api: GetNews) {
        self.api = api
    }
    
    public func newsGet() {
        api.getNews { [weak self] news in
            guard let self = self else { return }
            self.news = news.response.items
        }
    }
    
}

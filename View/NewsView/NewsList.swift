//
//  NewsList.swift
//  VKClientSwiftUI
//
//  Created by Alex on 17.12.2021.
//

import SwiftUI
import Kingfisher

struct NewsList: View {
    var newsGroup: Item
    
    
    
    var body: some View {
        VStack{
            HStack{
                KFImage(URL(string: newsGroup.attachments?[0].photo?.size?[0].url ?? ""))
            }
            
        }
    }
}

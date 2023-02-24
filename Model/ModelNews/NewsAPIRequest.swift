//
//  NewsAPIRequest.swift
//  VKClientSwiftUI
//
//  Created by Alex on 17.12.2021.
//

import Foundation
import Alamofire
import SwiftyJSON

protocol GetNews {
    func getNews(completion: @escaping (NewsCodable) -> ())
}

struct NewsAPI: GetNews {
    let baseURl = "https://api.vk.com/method"
    let token = Session.shared.token
    let userID = Session.shared.userID
    let version = "5.138"
    
    func getNews(completion: @escaping (NewsCodable) -> ()) {
        
        let parametrs: Parameters =
            [
                "client_id" : Session.shared.userID,
                "user_id": Session.shared.clientID,
                "filters" : "post",
                "count" : 20,
                "access_token": Session.shared.token,
                "v": "5.131",
                
            ]
        
        let method = "/newsfeed.get"
        
        let url = baseURl + method
        
        AF.request(url, method: .get, parameters: parametrs).responseData { respons in
            
            
            guard let data = respons.data else { return }
                        print(data.prettyJSON as Any)
            let decoder = JSONDecoder()
            let json = JSON(data)
            let dispatch = DispatchGroup()
            
            
       
            
            let nextFrom = json["response"]["next_from"].stringValue
            let JSONItemsArray = json["response"]["items"].arrayValue
            let JSONProfilesArray = json["response"]["profiles"].arrayValue
            let JSONGroupsArray = json["response"]["groups"].arrayValue
            
            var itemArray: [Item] = []
            var groupArray: [GroupNews] = []
            var profileArray: [Profile] = []
            
            DispatchQueue.global().async(group: dispatch) {
                for (index, groups) in JSONGroupsArray.enumerated() {
                    do {
                        let decodGroup = try decoder.decode(GroupNews.self, from: groups.rawData())
                        groupArray.append(decodGroup)
                    } catch {
                        print("\(index) \(error)")
                    }
                }
                for (index, items) in  JSONItemsArray.enumerated(){
                    do {
                        let decodItem = try decoder.decode(Item.self, from: items.rawData() )
                        itemArray.append(decodItem)
                        
                    } catch {
                        print("\(index) \(error)")
                    }
                }
                for (index, profile) in JSONProfilesArray.enumerated() {
                    do {
                        let decodProfile = try decoder.decode(Profile.self, from: profile.rawData())
                        profileArray.append(decodProfile)
                    } catch {
                        print("\(index) \(error)")
                    }
                }
            }
            
            dispatch.notify(queue: DispatchQueue.main){
                let respons = Response(items: itemArray, groups: groupArray, profiles: profileArray, nextFrom: nextFrom)
                let feed = NewsCodable(response: respons)
                completion(feed)
            }
            
        }
    }
}




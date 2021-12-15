//
//  GetFriendsRequest.swift
//  VKClientSwiftUI
//
//  Created by Alex on 14.12.2021.
//

import Foundation
import Alamofire

protocol GetFriends {
    func getFriends(completion: @escaping (FriendsCodable) -> ())
}


struct FriendsAPI: GetFriends {
    let baseURL = "https://api.vk.com/method"
    let token = Session.shared.token
    let userID = Session.shared.userID
    let version = "5.138"
    
    
    func getFriends(completion: @escaping (FriendsCodable) -> ()) {
        
        let method = "/friends.get"
        let parametrs: Parameters = [
            "user_id": Session.shared.userID,
            "fields": ["photo_100", "online", "bdate"],
            "count": 72,
            "access_token": Session.shared.token,
            "v": version
        ]
        
        let url = baseURL + method
        
        AF.request(url, method: .get, parameters: parametrs).responseData { response in
            guard let data = response.data else { return }
            print(data.prettyJSON as Any)
            do {
                var friends: FriendsCodable
                friends = try JSONDecoder().decode(FriendsCodable.self, from: data)
                completion(friends)
            } catch {
                print(error)
            }
            
            
        }
    }
}

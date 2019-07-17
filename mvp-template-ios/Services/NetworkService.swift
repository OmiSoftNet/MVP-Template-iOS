//
//  TempNetworkClient.swift
//  SwiftMvvm
//
//  Created by Руслан Федорович on 4/23/19.
//  Copyright © 2019 Руслан Федорович. All rights reserved.
//

import Foundation
import Alamofire

class NetworkService {
    
    static var shared: NetworkService {
        return NetworkService()
    }
    
    let baseUrlString = "https://chroniclingamerica.loc.gov"
    let postsQuerySring = "/newspapers.json"
    
    func getNewspapersList(completion: @escaping (NewspapersListResponse?, Error?) -> Void) {
        let urlString = baseUrlString + postsQuerySring
        Alamofire.request(urlString).responseJSON { response in
            print("Result: \(response.result)")
            
            guard let data = response.data, let entity: NewspapersListResponse = try? JSONDecoder().decode(NewspapersListResponse.self, from: data) else {
                print("Error parsing \(NewspapersListResponse.self)")
                return
            }
            completion(entity, response.error)
        }
    }

    func getNewspaperDetail(byUrl url: String, completion: @escaping (NewspaperDetail?, Error?) -> Void) {
        Alamofire.request(url).responseJSON { response in
            print("Result: \(response.result)")

            guard let data = response.data, let entity: NewspaperDetail = try? JSONDecoder().decode(NewspaperDetail.self, from: data) else {
                print("Error parsing \(NewspaperDetail.self)")
                return
            }
            completion(entity, response.error)
        }
    }
}

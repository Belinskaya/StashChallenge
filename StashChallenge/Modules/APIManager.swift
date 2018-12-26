//
//  APIManager.swift
//  StashChallenge
//
//  Created by kate on 12/26/18.
//  Copyright © 2018 kate. All rights reserved.
//

import UIKit

struct Response: Codable {
    let achievements: [Achievement]
    let status: Int
}
class APIManager {
    
    enum BackendError: Error {
        case urlError(reason: String)
        case objectSerialization(reason: String)
        case unknown
    }
    
    enum Result {
        case success([Achievement])
        case failure(BackendError)
    }
    
    func retrieveAchivement(completionHandler: @escaping (Result) -> Void) {
        //immitate call with few seconds of delay
        DispatchQueue.global(qos: .background).asyncAfter(deadline:  DispatchTime.now() + DispatchTimeInterval.seconds(2)) {
            guard let path = Bundle.main.path(forResource: "achievements", ofType: "json") else {
                completionHandler(.failure(.urlError(reason: "Did not find json for achievements" )))
                return
            }
            let fileUrl = URL(fileURLWithPath: path)
            guard let data = try? Data(contentsOf: fileUrl, options: Data.ReadingOptions.mappedIfSafe) else {
                completionHandler(.failure(.objectSerialization(reason: "Failed to retrieve data from achievements.json")))
                return
            }
            guard let response = try? JSONDecoder().decode(Response.self, from: data) else {
                completionHandler(.failure(.objectSerialization(reason: "Failed to decode achievements.json")))
                return
            }
            print(response)
            completionHandler(.success(response.achievements))
        }
    }
    
    func retrieveImage(at imageUrl: String, completionHandler: @escaping (UIImage?) -> Void) {
        guard let imageURL = URL(string: imageUrl) else {
            completionHandler(nil)
            return
        }
        let imageName = imageURL.lastPathComponent
        completionHandler(UIImage(named: imageName))
    }
    
}

//
//  Achievement.swift
//  StashChallenge
//
//  Created by kate on 12/26/18.
//  Copyright © 2018 kate. All rights reserved.
//

import Foundation

struct Achievement: Codable {
    let id: Int
    let level: String
    var progress: Int
    let total: Int
    let imageURL: String
    var accessible: Bool
    
    private enum CodingKeys : String, CodingKey {
        case id, level, progress, total, imageURL = "bg_image_url", accessible
    }
}

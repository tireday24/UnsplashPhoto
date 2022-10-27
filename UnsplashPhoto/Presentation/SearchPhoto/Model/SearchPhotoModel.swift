//
//  Model.swift
//  UnsplashPhoto
//
//  Created by 권민서 on 2022/10/27.
//

import Foundation

struct SearchPhoto: Codable, Hashable {
    let total, totalPages: Int
    let results: [Results]
    
    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

struct Results: Codable, Hashable {
    let id: String
    let urls: Urls
    let likes: Int
    
    enum CodingKeys: String, CodingKey {
        case id
        case urls, likes
    }
}

struct Urls: Codable, Hashable {
    let raw, full, regular, small: String
    let thumb, smallS3: String

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}


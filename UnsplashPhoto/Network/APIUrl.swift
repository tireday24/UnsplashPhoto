//
//  APIUrl.swift
//  UnsplashPhoto
//
//  Created by 권민서 on 2022/10/27.
//

import Foundation

enum URLConstant {
    static let baseURL = "https://api.unsplash.com"
    
    static let searchURL = baseURL + "/search/photos"
    static let listURL = baseURL + "/photos"
}

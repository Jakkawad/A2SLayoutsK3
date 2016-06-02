//
//  Dammy.swift
//  A2SLayoutsK3
//
//  Created by admin on 5/31/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import Foundation
import UIKit

func dummyImage(sizeDummy:String) -> String {
    
    let dummyImageUrl = "https://placehold.it/"+sizeDummy
    
    return dummyImageUrl
}

func urlStoreImage(imageUrl:String) -> NSURL {
    var baseUrl = "https://www.all2sale.com/store/"
    baseUrl += imageUrl
    let fullUrl = NSURL(string: baseUrl)
    return fullUrl!
}

func dummyText() -> String {
    let baseText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Donec placerat porta tempus. Fusce non suscipit."
    
    return baseText
}

func dummyPrice() -> String {
    let basePrice = "197.5"
    return basePrice
}
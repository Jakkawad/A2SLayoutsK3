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

func urlRatingImage(rating:String) -> NSURL {
    var baseRating = "https://www.all2sale.com/img/star"+rating+".png"
    
    let fullUrl = NSURL(string: baseRating)
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

func dummyDescription() -> String {
    let baseDescription = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus imperdiet dui egestas risus pretium cursus. Ut sagittis elementum tincidunt. Nam eleifend vel lacus ut maximus. Phasellus fringilla convallis sem, vel iaculis magna imperdiet ac. Proin ac urna sed massa varius porttitor vel id erat. Praesent blandit nisi eget finibus sodales. Duis orci lectus, pretium quis leo et, fermentum auctor risus. Aliquam eu nisi nec tellus tincidunt condimentum. Curabitur euismod lectus nisl."
    return baseDescription
}
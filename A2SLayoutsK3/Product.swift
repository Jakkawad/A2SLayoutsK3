//
//  Product.swift
//  A2SLayoutsK3
//
//  Created by admin on 6/4/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import Foundation

struct Product {
    var productId:String
    var productName:String
    var productImage:NSURL
    var productPrice:String
    
    init(_id:String, _name:String, _image:NSURL, _price:String) {
        productId = _id
        productName = _name
        productImage = _image
        productPrice = _price
    
    }
}
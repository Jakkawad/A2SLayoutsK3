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
    var productRating:NSURL
    
    init(_id:String, _name:String, _image:NSURL, _price:String, _rating:NSURL) {
        productId = _id
        productName = _name
        productImage = _image
        productPrice = _price
        productRating = _rating
    }
}

struct ProductSelected {
    static var productId:String = ""
}
/*
struct ProductDetail {
    var productId:String
    var productName:String
    var productDetail:String
    var productPrice:String
    var productImage:NSURL
    
    init(_id:String, _name:String, _detail:String, _price:String, _image:NSURL) {
        productId = _id
        productName = _name
        productDetail = _detail
        productPrice = _price
        productImage = _image
    }
}
*/
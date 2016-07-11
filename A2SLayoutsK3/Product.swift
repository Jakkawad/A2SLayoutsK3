//
//  Product.swift
//  A2SLayoutsK3
//
//  Created by admin on 6/4/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import Foundation


struct Product {
    var productId:String?
    var productName:String?
    var productPrice:String?
    var productShowImage:String?
    var productRating:String?
    /*
    init(_id:String, _name:String, _image:String, _price:String, _rating:String) {
        productId = _id
        productName = _name
        productShowImage = _image
        productPrice = _price
        productRating = _rating
    }
    */
    
    func description() {
        print("ProductId = \(productId)")
    }
}

/*
struct Product {
    var productId:Int?
    var productName:String?
    var productPrice:String?
    var productShowImage:String?
    var productRating:String?

}
*/
struct ProductSelected {
    static var productId:String = ""
    static var productArray:AnyObject!
    //static var productArray:NSArray = []
}

struct FromWhere {
    var fromWhere:String?
    
    init(_fromWhere:String) {
        fromWhere = _fromWhere
    }
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
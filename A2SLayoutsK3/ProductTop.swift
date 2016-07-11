//
//  ProductTop.swift
//  A2SLayoutsK3
//
//  Created by admin on 7/2/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ProductTopWrapper {
    var product:Array<ProductTops>?
    var count:Int?
    var next:String?
    var previous:String?
}

enum ProductTopFields:String {
    case productId = "Id"
    case productName = "ProductName"
    case productPrice = "ProductPrice"
    case productShowImage = "ProductShowImage"
    case productRating = "ProductRating"
    case productSubcat = "ProductSubcat"
}

class ProductTops {
    var idNumber:Int?
    var productId:String?
    var productName:String?
    var productPrice:String?
    var productShowImage:String?
    var productRating:String?
    var productSubcat:String?
    
    required init(json:JSON, id:Int?) {
        self.idNumber = id
        self.productId = json[ProductTopFields.productId.rawValue].stringValue
        self.productName = json[ProductTopFields.productName.rawValue].stringValue
        self.productPrice = json[ProductTopFields.productPrice.rawValue].stringValue
        self.productShowImage = json[ProductTopFields.productShowImage.rawValue].stringValue
        self.productRating = json[ProductTopFields.productRating.rawValue].stringValue
        self.productSubcat = json[ProductTopFields.productSubcat.rawValue].stringValue
        
        // TODO: all field
    }
    
    // MARK: Endpoints
    class func endpointForProductTop() -> String {
        return "http://rest.all2sale.com/productall/allrand.php?value=*&limit=8"
    }
    
    private class func getProductTopAtPath(path: String, completionHandler: (ProductTopWrapper?, NSError?) -> Void) {
        Alamofire.request(.POST, path).responseProductTopArray { response in
            if let error = response.result.error {
                completionHandler(nil, error)
                return
            }
            completionHandler(response.result.value, nil)
        }
    }
    
    class func getProductTop(completionHandler: (ProductTopWrapper?, NSError?) -> Void) {
        getProductTopAtPath(ProductTops.endpointForProductTop(), completionHandler: completionHandler)
    }
    
    class func getMoreProductTop(wrapper: ProductTopWrapper?, completionHandler: (ProductTopWrapper?, NSError?) -> Void) {
        if wrapper == nil || wrapper?.next == nil {
            completionHandler(nil, nil)
            return
        }
        getProductTopAtPath(wrapper!.next!, completionHandler: completionHandler)
    }
}

extension Alamofire.Request {
    func responseProductTopArray(completionHandler: Response<ProductTopWrapper, NSError> -> Void) -> Self {
        let responseSerializer = ResponseSerializer<ProductTopWrapper, NSError> { request, response, data, error in
            guard error == nil else {
                return .Failure(error!)
            }
            guard let responseData = data else {
                let failureReason = "Array could not be serialized because input data was nil."
                let error = Error.errorWithCode(.DataSerializationFailed, failureReason: failureReason)
                return .Failure(error)
            }
            let JSONResponseSerializer = Request.JSONResponseSerializer(options: .AllowFragments)
            let result = JSONResponseSerializer.serializeResponse(request, response, responseData, error)
            
            switch result {
            case .Success(let value):
                let json = SwiftyJSON.JSON(value)
                let wrapper = ProductTopWrapper()
                wrapper.next = json["next"].stringValue
                wrapper.previous = json["previous"].stringValue
                wrapper.count = json["count"].intValue
                
                var allProductTop = [ProductTops]()
                //print("JSON \(json)")
                let results = json["results"]
                //print("Result \(results)")
                for jsonProductTop in results {
                    //print("JSONProductTop = \(jsonProductTop.1)")
                    let productTop = ProductTops(json: jsonProductTop.1, id: Int(jsonProductTop.0))
                    if productTop.productRating == "" {
                        productTop.productRating = "0"
                    }
                    allProductTop.append(productTop)
                }
                wrapper.product = allProductTop
                return .Success(wrapper)
            case .Failure(let error):
                return .Failure(error)
                
            }
        }
        return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
}
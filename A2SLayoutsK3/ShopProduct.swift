//
//  ShopProduct.swift
//  A2SLayoutsK3
//
//  Created by admin on 6/27/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ShopProductWrapper {
    var product:Array<ShopProduct>?
    var count:Int?
    private var next:String?
    private var previous:String?
}

enum ShopProductFields:String {
    case productName = "ProductName"
}

class ShopProduct {
    var productId:Int?
    
    required init(json:JSON, id:Int?) {
        self.productId = id
    }
    // MARK: Endpoints
    class func endpointForShopProduct() -> String {
        return "https://www.all2sale.com/rest/productall/?value=*"
    }
    
    private class func getShopProductAtPath(path: String, completionHandler: (ShopProductWrapper?, NSError?) -> Void) {
        Alamofire.request(.GET, path).responseShopProductArray { response in
            if let error = response.result.error {
                completionHandler(nil, error)
                return
            }
            completionHandler(response.result.value, nil)
        }
    }
    class func getMoreShopProduct(wrapper: ShopProductWrapper?, completionHandler: (ShopProductWrapper?, NSError?) -> Void) {
        if wrapper == nil || wrapper?.next == nil {
            completionHandler(nil, nil)
            return
        }
        getShopProductAtPath(wrapper!.next!, completionHandler: completionHandler)
    }
    
    class func getShopProduct(completionHandler: (ShopProductWrapper?, NSError?) -> Void) {
        getShopProductAtPath(ShopProduct.endpointForShopProduct(), completionHandler: completionHandler)
    }
}

extension Alamofire.Request {
    func responseShopProductArray(completionHandler: Response<ShopProductWrapper, NSError> -> Void) -> Self {
        let responseSerializer = ResponseSerializer<ShopProductWrapper, NSError> { request, response, data, error in
            guard error == nil else {
                return .Failure(error!)
            }
            guard let responseData = data else {
                let failureReason = "Array could not be serialized because input dat a was nil."
                let error = Error.errorWithCode(.DataSerializationFailed, failureReason: failureReason)
                return .Failure(error)
            }
            let JSONResponseSerializer = Request.JSONResponseSerializer(options: .AllowFragments)
            let result = JSONResponseSerializer.serializeResponse(request, response, responseData, error)
            
            switch result {
            case .Success(let value):
                let json = SwiftyJSON.JSON(value)
                let wrapper = ShopProductWrapper()
                wrapper.next = json["next"].stringValue
                wrapper.previous = json["previous"].stringValue
                wrapper.count = json["count"].intValue
                
                var allProduct = [ShopProduct]()
                //print(json)
                let results = json["results"]
                //print(results)
                for jsonShopProduct in results {
                    //print(jsonShopProduct.1)
                    let product = ShopProduct(json: jsonShopProduct.1, id: Int(jsonShopProduct.0))
                    allProduct.append(product)
                }
                wrapper.product = allProduct
                return .Success(wrapper)
            case .Failure(let error):
                return .Failure(error)
            }
        }
        return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
}
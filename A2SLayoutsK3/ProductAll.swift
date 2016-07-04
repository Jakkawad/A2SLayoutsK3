//
//  ProductAll.swift
//  A2SLayoutsK3
//
//  Created by admin on 6/25/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ProductAllWrapper {
    var product:Array<ProductAlls>?
    var count:Int?
    private var next:String?
    private var previous:String?
}

enum ProductAllFields:String {
    case productId = "Id"
    case productName = "ProductName"
}

class ProductAlls {
    var productId:Int?
    var productName:String?
    
    required init(json:JSON, id:Int?) {
        self.productId = json[ProductAllFields.productId.rawValue].intValue
        self.productName = json[ProductAllFields.productName.rawValue].stringValue
    }
    // MARK: Endpoints
    class func endpointForProductAll() -> String {
        return "https://www.all2sale.com/rest/productall/?value=*"
    }
    
    private class func getProductAllAtPath(path: String, completionHandler: (ProductAllWrapper?, NSError?) -> Void) {
        Alamofire.request(.GET, path).responseProductAllArray { response in
            if let error = response.result.error {
                completionHandler(nil, error)
                return
            }
            completionHandler(response.result.value, nil)
        }
    }
    class func getMoreProductAll(wrapper: ProductAllWrapper?, completionHandler: (ProductAllWrapper?, NSError?) -> Void) {
        if wrapper == nil || wrapper?.next == nil {
            completionHandler(nil, nil)
            return
        }
        getProductAllAtPath(wrapper!.next!, completionHandler: completionHandler)
    }
    
    class func getProductAlls(completionHandler: (ProductAllWrapper?, NSError?) -> Void) {
        getProductAllAtPath(ProductAlls.endpointForProductAll(), completionHandler: completionHandler)
    }
}

extension Alamofire.Request {
    func responseProductAllArray(completionHandler: Response<ProductAllWrapper, NSError> -> Void) -> Self {
        let responseSerializer = ResponseSerializer<ProductAllWrapper, NSError> { request, response, data, error in
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
                let wrapper = ProductAllWrapper()
                wrapper.next = json["next"].stringValue
                wrapper.previous = json["previous"].stringValue
                wrapper.count = json["count"].intValue
                
                var allProducts = [ProductAlls]()
                //print(json)
                let results = json["results"]
                for jsonProductAlls in results {
                    //print("JSONProductRand = \(jsonProductAlls.1)")
                    let productAll = ProductAlls(json: jsonProductAlls.1, id: Int(jsonProductAlls.0))
                    allProducts.append(productAll)
                }
                wrapper.product = allProducts
                return .Success(wrapper)
            case .Failure(let error):
                return .Failure(error)
            }
        }
        return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
}
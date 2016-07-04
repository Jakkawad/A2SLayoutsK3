//
//  ProductFilter.swift
//  A2SLayoutsK3
//
//  Created by admin on 7/4/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ProductFilterWrapper {
    var product:Array<ProductFilter>?
    var count:Int?
    var next:String?
    var previous:String?
}

enum ProductFilterField:String {
    // Key in JSON
    case productId = "Id"
    case productName = "ProductName"
}

class ProductFilter {
    var productId:Int?
    var productName:String
    
    required init(json:JSON, id:Int?) {
        self.productId = json[ProductFilterField.productId.rawValue].intValue
        self.productName = json[ProductFilterField.productName.rawValue].stringValue
        
        // arrays
        
        // TODO: add all the fields!
    }
    
    // MARK: Endpoints
    class func endpointForProductFilter() -> String {
        return "https://"
    }
    
    private class func getProductFilterAtPath(path: String, completionHandler: (ProductFilterWrapper?, NSError?) -> Void) {
        Alamofire.request(.GET, path).responseProductFilterArray { response in
            if let error = response.result.error {
                completionHandler(nil, error)
                return
            }
            completionHandler(response.result.value, nil)
        }
    }
    
    class func getProductFilter(completionHandler: (ProductFilterWrapper?, NSError?) -> Void) {
        getProductFilterAtPath(ProductFilter.endpointForProductFilter(), completionHandler: completionHandler)
    }
    
    class func getMoreProductFilter(wrapper: ProductFilterWrapper?, completionHandler: (ProductFilterWrapper?, NSError?) -> Void) {
        if wrapper == nil || wrapper?.next == nil {
            completionHandler(nil, nil)
            return
        }
        getProductFilterAtPath(wrapper!.next!, completionHandler: completionHandler)
    }
}

extension Alamofire.Request {
    func responseProductFilterArray(completionHandler: Response<ProductFilterWrapper, NSError> -> Void) -> Self {
        let responseSerializer = ResponseSerializer<ProductFilterWrapper, NSError> { request, response, data, error in
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
                let wrapper = ProductFilterWrapper()
                wrapper.next = json["next"].stringValue
                wrapper.previous = json["previous"].stringValue
                wrapper.count = json["count"].intValue
                
                var allProduct = [ProductFilter]()
                print(json)
                let results = json["result"]
                print(results)
                for jsonProduct in results {
                    print(jsonProduct.1)
                    let products = ProductFilter(json: jsonProduct.1, id: Int(jsonProduct.0))
                    allProduct.append(products)
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
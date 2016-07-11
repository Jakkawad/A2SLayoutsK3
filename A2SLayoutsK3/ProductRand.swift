//
//  ProductRand.swift
//  A2SLayoutsK3
//
//  Created by admin on 6/24/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import Foundation
import Alamofire
import SwiftyJSON

class ProductRandWrapper {
    var product:Array<ProductRands>?
    var count:Int?
    var next:String?
    var previous:String?
}

enum ProductRandFields:String {
    case productId = "Id"
    case productName = "ProductName"
    case productPrice = "ProductPrice"
    case productShowImage = "ProductShowImage"
    case productRating = "ProductRating"
    case storeId = "StoreSid"
}

class ProductRands {
    var idNumber:Int?
    var productId:String?
    var productName:String?
    var productPrice:String?
    var productShowImage:String?
    var productRating:String?
    var storeId:String?
    
    required init(json:JSON, id:Int?) {
        self.idNumber = id
        self.productId = json[ProductTopFields.productId.rawValue].stringValue
        self.productName = json[ProductRandFields.productName.rawValue].stringValue
        self.productPrice = json[ProductRandFields.productPrice.rawValue].stringValue
        self.productShowImage = json[ProductRandFields.productShowImage.rawValue].stringValue
        self.productRating = json[ProductRandFields.productRating.rawValue].stringValue
        self.storeId = json[ProductRandFields.storeId.rawValue].stringValue
        // TODO: all field
    }
    
    // MARK: Endpoints
    class func endpointForProductRands() -> String {
        //return "https://www.all2sale.com/sendmail/testfunction/json/apitest.php"
        return "https://www.all2sale.com/rest/productall/?value=*"
        //return "https://www.all2sale.com/rest/productall"
        //return "https://www.all2sale.com/rest/format_api_mobile.php?api=productall&page=2"
    }
    
    private class func getProductRandAtPath(path: String, completionHandler: (ProductRandWrapper?, NSError?) -> Void) {
        Alamofire.request(.POST, path).responseProductRandsArray { response in
            if let error = response.result.error {
                completionHandler(nil, error)
                return
            }
            completionHandler(response.result.value, nil)
        }
    }
    
    class func getProductRands(completionHandler: (ProductRandWrapper?, NSError?) -> Void) {
        getProductRandAtPath(ProductRands.endpointForProductRands(), completionHandler: completionHandler)
    }
    
    class func getMoreProductRands(wrapper: ProductRandWrapper?, completionHandler: (ProductRandWrapper?, NSError?) -> Void) {
        if wrapper == nil || wrapper?.next == nil {
            completionHandler(nil, nil)
            return
        }
        getProductRandAtPath(wrapper!.next!, completionHandler: completionHandler)
    }
}

extension Alamofire.Request {
    func responseProductRandsArray(completionHandler: Response<ProductRandWrapper, NSError> -> Void) -> Self {
        let responseSerializer = ResponseSerializer<ProductRandWrapper, NSError> { request, response, data, error in
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
                let wrapper = ProductRandWrapper()
                wrapper.next = json["next"].stringValue
                wrapper.previous = json["previous"].stringValue
                wrapper.count = json["count"].intValue
                
                var allProductRands = [ProductRands]()
                //print("JSON = \(json)")
                let results = json["results"]
                //print("Result = \(results)")
                for jsonProductRands in results {
                    //print("JSONProductRand = \(jsonProductRands.1)")
                    let productRand = ProductRands(json: jsonProductRands.1, id: Int(jsonProductRands.0))
                    if productRand.productRating == "" {
                        productRand.productRating = "0"
                    } 
                    allProductRands.append(productRand)
                }
                wrapper.product = allProductRands
                return .Success(wrapper)
            case .Failure(let error):
                return .Failure(error)
            }
        }
        //return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
        return response(responseSerializer: responseSerializer, completionHandler: completionHandler)
    }
}
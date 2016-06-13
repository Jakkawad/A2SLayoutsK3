//
//  Page1Cell0TableViewCell.swift
//  A2SLayoutsK3
//
//  Created by admin on 5/31/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit
import MapleBacon
import Alamofire
import SwiftyJSON

class Page1Cell0TableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView:UICollectionView!
    
    //var products = [Product]()

    var dataArray = NSArray()
    
    func loadJSON() {
        Alamofire.request(.POST, BaseUrl.a2sUrl, parameters: ["api":"product_rand","product_rand":"8","value":"`Id`,`ProductName`,`ProductPrice`,`ProductShowImage`,`ProductRating`"]).responseJSON { response in
            //print(response.result.value)
            self.dataArray = response.result.value as! NSArray
            self.collectionView.reloadData()
            //print(self.dataArray)
            /*
            let value = response.result.value
            let json = JSON(value!)
            for(index, object) in json {
                let productID = object["Id"].stringValue
                let productName = object["ProductName"].stringValue
                let productImage = object["ProductShowImage"].stringValue
                let productPrice = object["ProductPrice"].stringValue
                let productRating = object["ProductRating"].stringValue
                var imageUrl = urlStoreImage(productImage)
                var imageRatingUrl = urlStoreImage(productRating)
                self.products.append(Product(_id: productID, _name: productName, _image: imageUrl, _price: productPrice, _rating: imageRatingUrl))
                self.collectionView.reloadData()
            }
            */
            
        }
    }
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataArray.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let col0 = collectionView.dequeueReusableCellWithReuseIdentifier(BaseCell.collectCell0, forIndexPath: indexPath) as? Page1Cell0CollectionViewCell
        
        // NSArray 
        let item = dataArray[indexPath.row] as! NSDictionary
        let imageProductUrl = urlStoreImage(item.objectForKey("ProductShowImage") as! String)
        col0?.lblProductName.text = item.objectForKey("ProductName") as? String
        col0?.lblProductPrice.text = item.objectForKey("ProductPrice") as? String
        col0?.imageViewProduct.setImageWithURL(imageProductUrl)
        // Struct
        /*
        let product:Product
        let dummyImageURL = NSURL(string: dummyImage("100x100"))
        //col0?.imageViewProduct.setImageWithURL(dummyImageURL!)
        product = products[indexPath.row]
        //print(product)
        col0?.lblProductName.text = product.productName
        col0?.lblProductPrice.text = product.productPrice
        col0?.imageViewProduct.setImageWithURL(product.productImage)
        */
        return col0!
    }
    /*
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //print(dataArray[indexPath.row])
        var didSelectedProduct = dataArray[indexPath.row]
        //print(didSelectedProduct)
        ProductSelected.productArray = didSelectedProduct
        //print(ProductSelected.productArray)
        
        let item = dataArray[indexPath.row] as! NSDictionary
        var productId = item.objectForKey("Id") as? String
        var productName = item.objectForKey("ProductName") as? String
        var productPrice = item.objectForKey("ProductPrice") as? String
        var productImage = item.objectForKey("ProductShowImage") as? String
        var productRating = item.objectForKey("ProductRating") as? String
        //print(item.objectForKey("ProductName") as? String)
        
        print(productId)
        //print(aa)
        //ProductSelected.productArray = aa
        //print(ProductSelected.productArray)
        //print(aa)
        //ProductSelected.productArray = aa
    }
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        loadJSON()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

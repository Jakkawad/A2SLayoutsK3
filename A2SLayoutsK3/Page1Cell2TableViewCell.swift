//
//  Page1Cell2TableViewCell.swift
//  A2SLayoutsK3
//
//  Created by admin on 5/31/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit
import MapleBacon
import Alamofire
import SwiftyJSON

class Page1Cell2TableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView:UICollectionView!
    
    //var products = [Product]()
    var dataArray = NSArray()
    
    func loadJSON() {
        Alamofire.request(.POST, BaseUrl.a2sUrl, parameters: ["api":"product_rand","product_rand":"8","value":"`Id`,`ProductName`,`ProductPrice`,`ProductShowImage`,`ProductRating`"]).responseJSON { response in
            self.dataArray = response.result.value as! NSArray
            self.collectionView.reloadData()
            //print(response.result.value)
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
                var imageRatingUrl = urlRatingImage(productRating)
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
        let col0 = collectionView.dequeueReusableCellWithReuseIdentifier(BaseCell.collectCell0, forIndexPath: indexPath) as? Page1Cell2CollectionViewCell
        // NSArray
        let item = dataArray[indexPath.row] as! NSDictionary
        let imageProductUrl = urlStoreImage((item.objectForKey("ProductShowImage") as? String)!)
        let imageRatingUrl = urlRatingImage((item.objectForKey("ProductRating") as? String)!)
        col0?.lblProductName.text = item.objectForKey("ProductName") as? String
        col0?.lblProductPrice.text = item.objectForKey("ProductPrice") as? String
        col0?.imageViewProduct.setImageWithURL(imageProductUrl)
        col0?.imageViewRating.setImageWithURL(imageRatingUrl)
        // Struct

        /*
        let dummyImageURL = NSURL(string: dummyImage("176x176"))
        let product:Product
        
        //col0?.imageViewProduct.setImageWithURL(dummyImageURL!)
        product = products[indexPath.row]
        //print(product)
        col0?.lblProductName.text = product.productName
        col0?.lblProductPrice.text = product.productPrice
        col0?.imageViewProduct.setImageWithURL(product.productImage)
        col0?.imageViewRating.setImageWithURL(product.productRating)
        */
        return col0!
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //print(products[indexPath.row])
        //let product:Product
        //product = products[indexPath.row]
        //print(product)
        //ProductSelected.productId = product.productId
        //print(ProductSelected.productId)
    }
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

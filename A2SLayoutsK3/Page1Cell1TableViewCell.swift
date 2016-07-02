//
//  Page1Cell1TableViewCell.swift
//  A2SLayoutsK3
//
//  Created by admin on 5/31/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit
import MapleBacon
import Alamofire
import SwiftyJSON

class Page1Cell1TableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView:UICollectionView!
    
    //var products = [Product]()
    var dataArray = NSArray()
    
    // Alamofire
    var product:Array<ProductTop>?
    var productTopWrapper:ProductTopWrapper?
    var isLoadingProducts = false
    
    //
    
    
    func loadFirstProducts() {
        isLoadingProducts = true
        ProductTop.getProductTop({ (productTopWrapper, error) in
            
            self.addProductsFromWrapper(productTopWrapper)
            self.isLoadingProducts = false
            self.collectionView.reloadData()
        })
    }
    
    func loadMoreProducts() {
        self.isLoadingProducts = true
        if self.product != nil && self.productTopWrapper != nil && self.product!.count < self.productTopWrapper!.count {
            ProductTop.getMoreProductTop(self.productTopWrapper, completionHandler: { (moreWrapper, error) in
                if error != nil {
                    // TODO: improved error handling
                    self.isLoadingProducts = false
                    let alert = UIAlertController(title: "Error", message: "Could not load more species \(error?.localizedDescription)", preferredStyle: UIAlertControllerStyle.Alert)
                    alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
                }
                print("got more!")
                self.addProductsFromWrapper(moreWrapper)
                self.isLoadingProducts = false
                self.collectionView.reloadData()
            })
        }
    }
    
    func addProductsFromWrapper(wrapper: ProductTopWrapper?) {
        self.productTopWrapper = wrapper
        if self.product == nil {
            self.product = self.productTopWrapper?.product
        } else if self.productTopWrapper != nil && self.productTopWrapper!.product != nil {
            self.product = self.product! + self.productTopWrapper!.product!
        }
    }
    
    func loadJSON() {
        Alamofire.request(.POST, BaseUrl.a2sUrl, parameters: ["api":"product_rand","product_rand":"8","value":"`Id`,`ProductName`,`ProductPrice`,`ProductShowImage`,`ProductRating`"]).responseJSON { response in
            //print(response.result.value)
            self.dataArray = response.result.value as! NSArray
            self.collectionView.reloadData()
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
        //return dataArray.count
        //return 8
        if self.product == nil {
            return 0
        }
        //print(product?.count)
        return self.product!.count

    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let col0 = collectionView.dequeueReusableCellWithReuseIdentifier(BaseCell.collectCell0, forIndexPath: indexPath) as? Page1Cell1CollectionViewCell
        
        let product = self.product![indexPath.row]
        col0?.lblProductName.text = product.productName
        col0?.imageViewProduct.setImageWithURL(urlStoreImage(product.productShowImage!))
        col0?.lblProductPrice.text = product.productPrice
        
        //col0?.imageViewProduct.setImageWithURL(NSURL(string: dummyImage("100x100"))!)
        /*
        // NSArray
        let item = dataArray[indexPath.row] as! NSDictionary
        let imageProductUrl = urlStoreImage(item.objectForKey("ProductShowImage") as! String)
        col0?.lblProductName.text = item.objectForKey("ProductName") as? String
        col0?.lblProductPrice.text = item.objectForKey("ProductPrice") as? String
        col0?.imageViewProduct.setImageWithURL(imageProductUrl)
        */
        // Struct
        /*
        let product:Product
        let dummyImageURL = NSURL(string: dummyImage("100x100"))
        //col0?.imageViewProduct.setImageWithURL(dummyImageURL!)
        product = products[indexPath.row]
        col0?.lblProductName.text = product.productName
        col0?.lblProductPrice.text = product.productPrice
        col0?.imageViewProduct.setImageWithURL(product.productImage)
        */
        return col0!
    }
    override func awakeFromNib() {
        super.awakeFromNib()
        //loadJSON()
        
        loadFirstProducts()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

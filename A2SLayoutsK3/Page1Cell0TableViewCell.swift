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
    
    var ASD = "DDD"
    
    // Alamofire
    var product:Array<ProductTops>?
    var productTopWrapper:ProductTopWrapper?
    var isLoadingProducts = false
    
    //
    
    //var productTop = Product()
    
    
    func loadFirstProducts() {
        isLoadingProducts = true
        ProductTops.getProductTop({ (productTopWrapper, error) in
            
            self.addProductsFromWrapper(productTopWrapper)
            self.isLoadingProducts = false
            self.collectionView.reloadData()
        })
    }
    
    func loadMoreProducts() {
        self.isLoadingProducts = true
        if self.product != nil && self.productTopWrapper != nil && self.product!.count < self.productTopWrapper!.count {
            ProductTops.getMoreProductTop(self.productTopWrapper, completionHandler: { (moreWrapper, error) in
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
        Alamofire.request(.POST, BaseUrl.a2sUrl, parameters: ["api":"product_Top","product_Rand":"8","value":"`Id`,`ProductName`,`ProductPrice`,`ProductShowImage`,`ProductRating`"]).responseJSON { response in
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
        //return dataArray.count
        //return 8
        if self.product == nil {
            return 0
        }
        //print(product?.count)
        return self.product!.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let col0 = collectionView.dequeueReusableCellWithReuseIdentifier(BaseCell.collectCell0, forIndexPath: indexPath) as? Page1Cell0CollectionViewCell
    
        //col0?.imageViewProduct.setImageWithURL(NSURL(string: dummyImage("100x100"))!)
        
        let product = self.product![indexPath.row]
        col0?.lblProductName.text = product.productName
        col0?.imageViewProduct.setImageWithURL(urlStoreImage(product.productShowImage!))
        col0?.lblProductPrice.text = product.productPrice
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
        //print(product)
        col0?.lblProductName.text = product.productName
        col0?.lblProductPrice.text = product.productPrice
        col0?.imageViewProduct.setImageWithURL(product.productImage)
        */
        return col0!
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //print(dataArray[indexPath.row])
        //let product = self.product![indexPath.row]
        //var test = Product(_id: product.productId!, _name: product.productName!, _image: product.productShowImage!, _price: product.productPrice! , _rating: product.productRating!)
        //print(test)
        //print(product![indexPath.row])
        var productTop = Product()
        let product = self.product![indexPath.row]
        //print(product.productId)
        var productIdString = String(product.productId!)
        productTop.productId = product.productId
        productTop.description()
        //var test = Product(_id: productIdString, _name: product.productName!, _image: product.productShowImage!, _price: product.productPrice! , _rating: product.productRating!)
        //print(FromWhere)
        //self.performSegueWithIdentifire
        //Product.init(_id: product.productId!, _name: product.productName!, _image: product.productShowImage!
        //    , _price: product.productPrice!, _rating: product.productRating!)
        //print(Product)
        //print(product)
        //print(product.productName)
        //let VC = Page1ProductDetailViewController()
        //VC.productDetail = self.product![indexPath.row]
        //let destinationVC = segue.destinationViewController as? Page1ProductDetailViewController
        //destinationVC?.product = product
        
        /*
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
        
        */
        
        //print(aa)
        //ProductSelected.productArray = aa
        //print(ProductSelected.productArray)
        //print(aa)
        //ProductSelected.productArray = aa
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

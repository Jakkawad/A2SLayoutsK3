//
//  Page1ProductAllViewController.swift
//  A2SLayoutsK3
//
//  Created by admin on 6/2/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MapleBacon

class Page1ProductAllViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    private let maximumNumberOfItems = 100
    private let numberOfItemsToAdd = 10
    private var numberOfItems = 10
    
    //private var numberOfItemPerSection = 16
    
    // Array
    var arrayA = []
    var arrayB = []
    var arrayC = []
    
    //var products = [Product]()
    var dataArray = NSArray()
    
    // Alamofire
    var product:Array<ProductRands>?
    var productRandWrapper:ProductRandWrapper?
    var isLoadingProducts = false
    
    //
    
    func loadFirstProducts() {
        isLoadingProducts = true
        ProductRands.getProductRands({ (productRandWrapper, error) in
            if error != nil {
                let alert = UIAlertController(title: "Error", message: "Could not load first product \(error?.localizedDescription)", preferredStyle: UIAlertControllerStyle.Alert)
                alert.addAction(UIAlertAction(title: "Click", style: UIAlertActionStyle.Default, handler: nil))
                self.presentViewController(alert, animated: true, completion: nil)
            }
            self.addProductsFromWrapper(productRandWrapper)
            self.isLoadingProducts = false
            self.collectionView.reloadData()
        })
    }
    
    func loadMoreProducts() {
        self.isLoadingProducts = true
        if self.product != nil && self.productRandWrapper != nil && self.product!.count < self.productRandWrapper!.count {
            ProductRands.getMoreProductRands(self.productRandWrapper, completionHandler: { (moreWrapper, error) in
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
    
    func addProductsFromWrapper(wrapper: ProductRandWrapper?) {
        self.productRandWrapper = wrapper
        if self.product == nil {
            self.product = self.productRandWrapper?.product
        } else if self.productRandWrapper != nil && self.productRandWrapper!.product != nil {
            self.product = self.product! + self.productRandWrapper!.product!
        }
    }
    
    func loadJSON() {
        /*
        Alamofire.request(.POST,BaseUrl.a2sUrl,parameters: ["api":"product_rand","product_rand":numberOfItemPerSection,"value":"`Id`,`ProductName`,`ProductPrice`,`ProductShowImage`,`ProductRating`"]).responseJSON { response in
            //print(response.result)
            self.dataArray = response.result.value as! NSArray
            self.collectionView.reloadData()
            
        }
        */
        
        Alamofire.request(.POST,BaseUrl.a2sUrl,parameters: ["api":"product_rand","product_rand":"1","value":"`Id`,`ProductName`,`ProductPrice`,`ProductShowImage`,`ProductRating`"]).responseJSON { response in
            //print(response.result)
            self.dataArray = response.result.value as! NSArray
            //self.dataArray += response.result.value as! NSArray
            //var json = response.result.value as! NSArray
            //print(json)
            //self.dataArray = json
            self.collectionView.reloadData()
            //self.reloadData()
            print(self.dataArray)
            //print("DataArray Count = \(self.dataArray.count)")
        }
        
    }
    

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return dataArray.count
        //return numberOfItems
        if self.product == nil {
            return 0
        }
        //print(product?.count)
        return self.product!.count
        
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let col0 = collectionView.dequeueReusableCellWithReuseIdentifier(BaseCell.collectCell0, forIndexPath: indexPath) as? Page1ProductAllCollectionViewCell
        // NSArray
        
        //let dummyImageURL = NSURL(string: dummyImage("176x176"))
        col0?.imageViewProduct.setImageWithURL(NSURL(string: dummyImage("176x176"))!)
        // SwiftyJSON
        if self.product != nil && self.product!.count >= indexPath.row {
            let product = self.product![indexPath.row]
            col0?.lblProductName.text = product.productName
            
            // See if we need to load more product
            let rowsToLoadFromBottom = 5
            let rowsLoaded = self.product!.count
            if (!self.isLoadingProducts && (indexPath.row >= (rowsLoaded - rowsToLoadFromBottom))) {
                let totalRows = self.productRandWrapper!.count!
                let remainingProductsToLoad = totalRows - rowsLoaded
                if (remainingProductsToLoad > 0 ) {
                    self.loadMoreProducts()
                }
            } 
        }
        
        // NSDictionaty
        /*
        let item = dataArray[indexPath.row] as! NSDictionary
        let imageProductUrl = urlStoreImage((item.objectForKey("ProductShowImage") as? String)!)
        let imageRatingUrl = urlRatingImage((item.objectForKey("ProductRating") as? String)!)
        col0?.lblProductName.text = item.objectForKey("ProductName") as? String
        col0?.lblProductPrice.text = item.objectForKey("ProductPrice") as? String
        col0?.imageViewProduct.setImageWithURL(imageProductUrl)
        col0?.imageViewRating.setImageWithURL(imageRatingUrl)
        */
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
    
    func reloadData() {
        collectionView.reloadData()
    }
    /*
    func scrollViewDidScroll(scrollView: UIScrollView) {
        /*
        let offsetY = scrollView.contentOffset.y
        //print("offsetY\(offsetY)")
        let contentHeight = scrollView.contentSize.height
        //print("contentHeight\(contentHeight)")
        //if offsetY > contentHeight - scrollView.frame.size.height {
        if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height) {
            /*
            numberOfItemPerSection += 9
            //self.collectionView.reloadData()
            print("numberOfItemPerSection\(numberOfItemPerSection)")
            loadJSON()
            */
            /*
            numberOfItems += numberOfItemsToAdd
            //collectionView.reloadData()
            reloadData()
            //loadJSON()
            */
            print("NumberOfItems = \(numberOfItems)")
            if numberOfItems == 100 {
                print("Out of RANG!!")
            } else {
                //print("<100")
                numberOfItems += numberOfItemsToAdd
                //loadJSON()
                reloadData()

            }
        }
        */
        let currenOffset = scrollView.contentOffset.y
        let maximumOffset = scrollView.contentSize.height - scrollView.frame.size.height
        if maximumOffset - currenOffset <= 10.0 {
            //print("DADD")
            //numberOfItems += numberOfItemsToAdd
            //reloadData()
            print("NumberOfItems = \(numberOfItems)")
            if numberOfItems == 100 {
                print("Out of RANG!!")
            } else {
                numberOfItems += numberOfItemsToAdd
                loadJSON()
                reloadData()
            }
        }
    }
    */
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //loadJSON()
        loadFirstProducts()
        //self.collectionView.reloadData()
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}

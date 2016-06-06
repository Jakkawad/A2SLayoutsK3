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
    
    private var numberOfItemPerSection = 16
    
    var products = [Product]()
    
    func loadJSON() {
        /*
        Alamofire.request(.POST,BaseUrl.a2sUrl,parameters: ["api":"productall","productall":numberOfItemPerSection]).responseJSON { response in
            //print(response.result)
            self.dataJSON = response.result.value as! NSArray
            //print(self.dataJSON.description)
            self.collectionView.reloadData()
            
        }
        */
        print(numberOfItemPerSection)
        Alamofire.request(.POST, BaseUrl.a2sUrl, parameters: ["api":"product_rand","product_rand":numberOfItemPerSection,"value":"`Id`,`ProductName`,`ProductPrice`,`ProductShowImage`,`ProductRating`"]).responseJSON { response in
            //print(response.result.value)
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
            //self.collectionView.reloadData()
        }
        
    }
    

    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //return 10
        //eturn self.dataJSON.count
        //return numberOfItemPerSection
        print("products count = \(products.count)")
        return products.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let col0 = collectionView.dequeueReusableCellWithReuseIdentifier(BaseCell.collectCell0, forIndexPath: indexPath) as? Page1ProductAllCollectionViewCell
        let dummyImageURL = NSURL(string: dummyImage("176x176"))
        let product:Product
        
        //col0?.imageViewProduct.setImageWithURL(dummyImageURL!)
        product = products[indexPath.row]
        //print(product)
        col0?.lblProductName.text = product.productName
        col0?.lblProductPrice.text = product.productPrice
        col0?.imageViewProduct.setImageWithURL(product.productImage)
        col0?.imageViewRating.setImageWithURL(product.productRating)

        return col0!
    }
    
    func scrollViewDidScroll(scrollView: UIScrollView) {
        let offsetY = scrollView.contentOffset.y
        print("offsetY\(offsetY)")
        let contentHeight = scrollView.contentSize.height
        print("contentHeight\(contentHeight)")
        //if offsetY > contentHeight - scrollView.frame.size.height {
        if ((scrollView.contentOffset.y + scrollView.frame.size.height) >= scrollView.contentSize.height) {
            numberOfItemPerSection += 6
            print("PLUSS")
            //print("numberOfItemPerSection = \(numberOfItemPerSection)")
            loadJSON()
            self.collectionView.reloadData()
            /*
            loadJSON()
            if numberOfItemPerSection > 35 {
                print("5555")
                activityIndicator.startAnimating()
                let delay = 1 * Double(NSEC_PER_SEC)
                let time = dispatch_time(DISPATCH_TIME_NOW, Int64(delay))
                dispatch_after(time, dispatch_get_main_queue()) {
                    self.activityIndicator.stopAnimating()
                }
            } else {
                print("DDD")
            }
            */
        }
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadJSON()
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

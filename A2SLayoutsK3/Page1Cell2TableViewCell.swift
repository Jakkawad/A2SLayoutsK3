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
    
    var products = [Product]()
    
    func loadJSON() {
        Alamofire.request(.POST, "https://www.all2sale.com/sendmail/testfunction/json/apitest.php", parameters: ["api":"product_rand","product_rand":"8","value":"`Id`,`ProductName`,`ProductPrice`,`ProductShowImage`,`ProductRating`"]).responseJSON { response in
            //print(response.result.value)
            let value = response.result.value
            let json = JSON(value!)
            for(index, object) in json {
                let productID = object["Id"].stringValue
                let productName = object["ProductName"].stringValue
                let productImage = object["ProductShowImage"].stringValue
                let productPrice = object["ProductPrice"].stringValue
                var imageUrl = urlStoreImage(productImage)
                self.products.append(Product(_id: productID, _name: productName, _image: imageUrl, _price: productPrice))
                self.collectionView.reloadData()
            }
        }
    }

    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return products.count
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let col0 = collectionView.dequeueReusableCellWithReuseIdentifier(BaseCell.collectCell0, forIndexPath: indexPath) as? Page1Cell2CollectionViewCell
        let dummyImageURL = NSURL(string: dummyImage("176x176"))
        let product:Product
        //col0?.imageViewProduct.setImageWithURL(dummyImageURL!)
        product = products[indexPath.row]
        col0?.lblProductName.text = product.productName
        col0?.lblProductPrice.text = product.productPrice
        col0?.imageViewProduct.setImageWithURL(product.productImage)
        return col0!
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

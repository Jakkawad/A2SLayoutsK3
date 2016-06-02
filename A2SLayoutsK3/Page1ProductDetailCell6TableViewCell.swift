//
//  Page1ProductDetailCell6TableViewCell.swift
//  A2SLayoutsK3
//
//  Created by admin on 6/2/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MapleBacon

class Page1ProductDetailCell6TableViewCell: UITableViewCell, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let col0 = collectionView.dequeueReusableCellWithReuseIdentifier(BaseCell.collectCell0, forIndexPath: indexPath) as? Page1ProductDetailCell6CollectionViewCell
        let dummyImageURL = NSURL(string: dummyImage("100x100"))
        col0?.imageViewProduct.setImageWithURL(dummyImageURL!)
        col0?.lblProductName.text = dummyText()
        col0?.lblProductPrice.text = dummyPrice()
        return col0!
    }

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

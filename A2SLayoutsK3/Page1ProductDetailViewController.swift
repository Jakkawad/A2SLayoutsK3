//
//  Page1ProductDetailViewController.swift
//  A2SLayoutsK3
//
//  Created by admin on 5/31/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit
import MapleBacon
import Alamofire
import SwiftyJSON

class Page1ProductDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView:UITableView!
    
    var productDetailArray = NSArray()
    
    /*
    
    func loadJSON() {
        Alamofire.request(.POST, BaseUrl.a2sUrl, parameters: ["api":"product_detail_id","product_detail_id":ProductSelected.productId,"value":"`Id`,`ProductName`,`ProductPrice`,`ProductShowImage`,`ProductRating`"]).responseJSON { response in
         print(response.result.value)
        
        }
        
    }
    */
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 8
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 2
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return 3
        } else if section == 3 {
            return 1
        } else if section == 4 {
            return 1
        } else if section == 5 {
            return 1
        } else if section == 6{
            return 1
        } else {
            return 1
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        /*
         section 0
        Image
         section 1
        Description
         section 2
        Review
         section 3
        Payment
         section 4
        Shipping
         section 5
        Warranty
         section 6
        Shop
         section 7
        Other
        */
        if indexPath.section == 0 {
            //Image
            let cell0 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell0) as? Page1ProductDetailCell0TableViewCell
                let dummyImageURL = NSURL(string: dummyImage("250x176"))
                cell0?.imageViewProduct.setImageWithURL(dummyImageURL!)
                cell0?.lblProductName.text = dummyText()
                cell0?.lblProductPrice.text = dummyPrice()
            return cell0!
        } else if indexPath.section == 1 {
            //Description
            let cell1 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell1) as? Page1ProductDetailCell1TableViewCell
            
            cell1?.lblProductDescription.text = dummyDescription()
            
            return cell1!
        } else if indexPath.section == 2 {
            //Review
            let cell2 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell2)
            return cell2!
        } else if indexPath.section == 3 {
            //Payment
            let cell3 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell3)
            return  cell3!
        } else if indexPath.section == 4 {
            //Shipping
            let cell4 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell4)
            return cell4!
        } else if indexPath.section == 5 {
            //Warranty
            let cell5 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell5)
            return cell5!
        } else if indexPath.section == 6 {
            let cell7 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell7) as? Page1ProductDetailCell7TableViewCell
            let dummyImageURL = NSURL(string: dummyImage("80x80"))
            cell7?.imageViewShop.setImageWithURL(dummyImageURL!)
            
            return cell7!
        } else {
            //Other
            let cell6 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell6) as? Page1ProductDetailCell6TableViewCell
            return cell6!
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 240
        } else if indexPath.section == 1 {
            return 100
        } else if indexPath.section == 2 {
            return 100
        } else if indexPath.section == 3 {
            return 100
        } else if indexPath.section == 4 {
            return 100
        } else if indexPath.section == 5 {
            return 100
        } else if indexPath.section == 6 {
            return 100
        } else {
            return 224
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return ""
        } else if section == 1 {
            return "Product Detail"
        } else if section == 2 {
            return "Review"
        } else if section == 3 {
            return "Payment"
        } else if section == 4 {
            return "Shipping"
        } else if section == 5 {
            return "Warranty"
        } else if section == 6 {
            return "Shop"
        } else {
            return "Other Product"
        }
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat.min
        }
        return 25
    }
    
    func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        //return false
        if indexPath.section == 0 {
            return false
        } else {
            return true
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 1 {
            self.performSegueWithIdentifier("ProductDetailSeguePage1", sender: self)
        } else if indexPath.section == 6 {
            self.performSegueWithIdentifier("ShopSeguePage1", sender: self)
        } else {
            print("else")
        }
    }
 
    override func viewDidLoad() {
        super.viewDidLoad()
        //print(ProductSelected.productArray)
        //ProductSelected.productArray = productDetailArray as! NSArray
        //let item = productDetailArray as! NSDictionary
        //print(item.objectForKey("ProductName"))
        //productDetailArray = (ProductSelected.productArray as? NSArray)!
        //print(productDetailArray)
        //print(productDetailArray)
        //loadJSON()
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

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
    
    var productDetail:ProductRands?
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        //return 8
        //return 9
        return 9
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 2
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else if section == 2 {
            return 1
        } else if section == 3 {
            return 1
        } else if section == 4 {
            return 1
        } else if section == 5 {
            return 1
        } else if section == 6 {
            return 1
        } else if section == 7 {
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
        Option
         section 3
        Button
         section 4
        Review
         section 5
        Shipping
         section 6
        Warranty
         section 7
        Shop
         section 8
        Other
        */
        
        if indexPath.section == 0 {
            //Image
            let cell0 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell0) as? Page1ProductDetailCell0TableViewCell
                let dummyImageURL = NSURL(string: dummyImage("250x176"))
                //cell0?.imageViewProduct.setImageWithURL(dummyImageURL!)
                //cell0?.imageViewProduct.setImageWithURL(urlStoreImage(productDetail!.productShowImage!))
                cell0?.lblProductName.text = productDetail?.productName
                cell0?.lblProductPrice.text = productDetail?.productPrice
            //print(productDetail!.productId!)
            return cell0!
        } else if indexPath.section == 1 {
            //Description
            let cell1 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell1) as? Page1ProductDetailCell1TableViewCell
            
            cell1?.lblProductDescription.text = dummyDescription()
            
            return cell1!
        
        } else if indexPath.section == 2 {
            //Option
            let cell8 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell8) as? Page1ProductDetailCell8TableViewCell
            return cell8!
        } else if indexPath.section == 3 {
            //Button
            let cell2 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell2)
            return cell2!
        } else if indexPath.section == 4 {
            //Payment
            let cell3 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell3)
            return  cell3!
        } else if indexPath.section == 5 {
            //Shipping
            let cell4 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell4)
            return cell4!
        } else if indexPath.section == 6 {
            //Warranty
            let cell5 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell5)
            return cell5!
        } else if indexPath.section == 7 {
            //Shop
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
            return 130
            //return 224
        } else if indexPath.section == 3 {
            return 224
            //return 100
        } else if indexPath.section == 4 {
            return 100
        } else if indexPath.section == 5 {
            return 100
        } else if indexPath.section == 6 {
            return 100
        } else if indexPath.section == 7 {
            return 100
        } else {
            //return 145
            //return 180
            return 224
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return ""
        } else if section == 1 {
            return "Product Detail"
        } else if section == 2 {
            //return "Review"
            return ""
        } else if section == 3 {
            return "Review"
            //return "Payment"
        } else if section == 4 {
            return "Payment"
            //return "Shipping"
        } else if section == 5 {
            return "Shipping"
            //return "Warranty"
        } else if section == 6 {
            return "Warranty"
            //return "Shop"
        } else if section == 7{
            return "Shop"
            //return ""
        } else {
            return "Other"
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "ProductDetailSegue" {
            //print("Option")
            let destinationVC = segue.destinationViewController as? Page1ProductDetailProductDetailViewController
            destinationVC!.productDetail = productDetail
        } else {
            print("Error")
        }
    }
    
    /*
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        /*
        if indexPath.section == 1 {
            self.performSegueWithIdentifier("ProductDetailSeguePage1", sender: self)
        } else if indexPath.section == 6 {
            self.performSegueWithIdentifier("ShopSeguePage1", sender: self)
        } else {
            print("else")
        }
        */
        if indexPath.section == 2 {
            self.performSegueWithIdentifier("OptionSegue", sender: self)
            
        } else {
            print("Else")
        }
    }
    */
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

//
//  Page1ProductDetailViewController.swift
//  A2SLayoutsK3
//
//  Created by admin on 5/31/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit
import MapleBacon

class Page1ProductDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView:UITableView!
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 7
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
        } else {
            return 1
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        /*
         section 0
        Image
         section 1
        Name
         section 2
        Review
         section 3
        Payment
         section 4
        Shipping
         section 5
        Warranty
         section 6
        Other
        */
        if indexPath.section == 0 {
            let cell0 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell0) as? Page1ProductDetailCell0TableViewCell
                let dummyImageURL = NSURL(string: dummyImage("250x176"))
                cell0?.imageViewProduct.setImageWithURL(dummyImageURL!)
                cell0?.lblProductName.text = dummyText()
                cell0?.lblProductPrice.text = dummyPrice()
            return cell0!
        } else if indexPath.section == 1 {
            let cell1 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell1)
            return cell1!
        } else if indexPath.section == 2 {
            let cell2 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell2)
            return cell2!
        } else if indexPath.section == 3 {
            let cell3 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell3)
            return  cell3!
        } else if indexPath.section == 4 {
            let cell4 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell4)
            return cell4!
        } else if indexPath.section == 5 {
            let cell5 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell5)
            return cell5!
        } else {
            let cell6 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell6)
            return cell6!
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 240
        } else if indexPath.section == 1 {
            return 100
        } else if indexPath.section == 2 {
            return 44
        } else if indexPath.section == 3 {
            return 44
        } else if indexPath.section == 4 {
            return 44
        } else if indexPath.section == 5 {
            return 44
        } else {
            return 224
        }
    }
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat.min
        }
        return 25
    }
    
    func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

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

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
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 2
        if section == 0 {
            return 1
        } else if section == 1 {
            return 3
        } else {
            return 1
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        /*
        let cell0 = tableView.dequeueReusableCellWithIdentifier("tableCell0")
        return cell0!
        */
        if indexPath.section == 0 {
            // Section 0
            if indexPath.row == 0 {
                let cell0 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell0) as? Page1ProductDetailCell0TableViewCell
                let dummyImageURL = NSURL(string: dummyImage("250x176"))
                cell0?.imageViewProduct.setImageWithURL(dummyImageURL!)
                cell0?.lblProductName.text = dummyText()
                return cell0!
            } else {
                let cell1 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell1)
                return cell1!
            }
        } else if indexPath.section == 1 {
            // Section 1
            if indexPath.row == 0 {
                let cell2 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell2)
                return cell2!
            } else {
                let cell3 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell3)
                return  cell3!
            }
        } else {
            let cell4 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell4)
            return cell4!
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return 240
            } else {
                return 100
            }
        } else if indexPath.section == 1 {
            if indexPath.row == 0 {
                return 100
            } else {
                return 44
            }
        } else {
            return 44
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

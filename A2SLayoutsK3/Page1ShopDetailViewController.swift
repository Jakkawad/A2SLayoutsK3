//
//  Page1ShopDetailViewController.swift
//  A2SLayoutsK3
//
//  Created by admin on 6/13/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit
import MapleBacon
import Alamofire
import SwiftyJSON

class Page1ShopDetailViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView:UITableView!
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 3
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 1
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else {
            return 2
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            let cell0 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell0) as? Page1ShopDetailCell0TableViewCell
            let dummyImageURL = NSURL(string: dummyImage("375x120"))
            let dummyImageURL2 = NSURL(string: dummyImage("100x100"))
            cell0?.imageViewShopDisplay.setImageWithURL(dummyImageURL2!)
            cell0?.imageViewCover.setImageWithURL(dummyImageURL!)
            return cell0!
        } else if indexPath.section == 1 {
            let cell1 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell1)
            return cell1!
        } else {
            if indexPath.row == 0 {
                let cell2 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell2) as? Page1ShopDetailCell2TableViewCell
                return cell2!
            } else {
                let cell3 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell3)
                return cell3!
            }
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 200
        } else if indexPath.section == 1 {
            return 100
        } else {
            if indexPath.row == 0 {
                return 1000
            } else {
                return 44
            }
        }
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

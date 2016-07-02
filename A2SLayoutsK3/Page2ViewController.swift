//
//  Page2ViewController.swift
//  A2SLayoutsK3
//
//  Created by Jakkawad Chaiplee on 6/3/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON
import MapleBacon

class Page2ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView:UITableView!
    
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 1
        
        if section == 0 {
            return 2
        } else {
            return 2
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                let cell0 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell0)
                return cell0!
            } else {
                
                let cell1 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell1) as? Page2Cell1TableViewCell
                let dummyImageURL = NSURL(string: dummyImage("100x100"))
                cell1?.imageViewProduct.setImageWithURL(dummyImageURL!)
                return cell1!
            }
        } else {
            if indexPath.row == 0 {
                let cell0 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell0)
                return cell0!
            } else {
                let cell1 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell1) as? Page2Cell1TableViewCell
                let dummyImageURL = NSURL(string: dummyImage("100x100"))
                cell1?.imageViewProduct.setImageWithURL(dummyImageURL!)
                return cell1!
            }

        }
        //let cell0 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell0)
        //return cell0!
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            if indexPath.row == 0 {
                return 44
            } else {
                return 160
            }
        } else {
            if indexPath.row == 0 {
                return 44
            } else {
                return 160
            }
        }
    }
    /*
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Shop Name"
    }
    */
    
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Cart"
        
        
        ProductRands.getProductRands({ (productRandWrapper, error) in
            
            
        })
        
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

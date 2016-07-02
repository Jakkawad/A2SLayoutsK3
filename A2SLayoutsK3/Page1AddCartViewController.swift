//
//  Page1AddCartViewController.swift
//  A2SLayoutsK3
//
//  Created by admin on 6/29/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit

class Page1AddCartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    let rowHeight:CGFloat = 44
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 1
        if section == 0 {
            return 1
        } else if section == 1 {
            return 1
        } else {
            return 1
        }
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        /*
        let cell0 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell0)
        return cell0!
        */
        if indexPath.section == 0 {
            let cell0 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell0) as? Page1AddCartCell0TableViewCell
            return cell0!
        } else if indexPath.section == 1 {
            let cell1 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell1) as? Page1AddCartCell1TableViewCell
            return cell1!
        } else if indexPath.section == 2 {
            let cell2 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell2) as? Page1AddCartCell2TableViewCell
            return cell2!
        } else {
            let cell3 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell3) as? Page1AddCartCell3TableViewCell
            return cell3!
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            //let h:CGFloat = 44
            let x:CGFloat = 5
            return rowHeight * x
        } else if indexPath.section == 1 {
            //let hh:CGFloat = 44
            let xx:CGFloat = 4
            return rowHeight * xx
        } else if indexPath.section == 2 {
            return 200
        } else {
            return rowHeight
        }
    }
    
    func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0 {
            return "Color"
        } else if section == 1 {
            return "Size"
        } else if section == 2 {
            return "Quality"
        } else {
            return ""
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

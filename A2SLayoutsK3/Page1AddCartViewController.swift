//
//  Page1AddCartViewController.swift
//  A2SLayoutsK3
//
//  Created by admin on 6/29/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit

class Page1AddCartViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 1
        if section == 0 {
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
            let cell0 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell0) as? Page1AddCareCell0TableViewCell
            return cell0!
        } else {
            let cell1 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell1) as? Page1AddCareCell1TableViewCell
            return cell1!
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.section == 0 {
            return 220
        } else {
            return 220
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

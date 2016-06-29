//
//  Page1ProductDetailCell8TableViewCell.swift
//  A2SLayoutsK3
//
//  Created by admin on 6/29/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit

class Page1ProductDetailCell8TableViewCell: UITableViewCell, UITableViewDataSource ,UITableViewDelegate {

    @IBOutlet weak var tableView:UITableView!
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //return 3
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
            let cell0 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell0) as? Page1ProductDetailOptionCell0TableViewCell
            return cell0!
        } else {
            //Description
            let cell1 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell1) as? Page1ProductDetailOptionCell1TableViewCell
            return cell1!
        }
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if indexPath.section == 0 {
            print("Buy")
        } else {
            print("Watch")
        }
    }
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return CGFloat.min
        }
        return 0.5
    }
    /*
    func tableView(tableView: UITableView, shouldHighlightRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        //return false
        if indexPath.section == 0 {
            return false
        } else {
            return true
        }
    }
    */
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}

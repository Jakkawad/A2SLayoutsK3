//
//  Page1ProductDetailCell2TableViewCell.swift
//  A2SLayoutsK3
//
//  Created by admin on 6/1/2559 BE.
//  Copyright © 2559 All2Sale. All rights reserved.
//

import UIKit

class Page1ProductDetailCell2TableViewCell: UITableViewCell, UITableViewDataSource ,UITableViewDelegate {

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        /*
        let cell0 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell0)
        return cell0!
        */
        if indexPath.row == 1 {
            let cell1 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell1)
            return cell1!
        } else {
            let cell0 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell0) as? Page1ProductDetailCell2ReviewCell0TableViewCell
            let dummyImageURL = NSURL(string: dummyImage("50x50"))
            cell0?.imageViewProfile.setImageWithURL(dummyImageURL!)
            return cell0!
        }
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        if indexPath.row == 1 {
            return 44
        } else {
            return 60
        }
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

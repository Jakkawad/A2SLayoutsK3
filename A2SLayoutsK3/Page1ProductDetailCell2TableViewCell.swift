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
        return 4
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        /*
        let cell0 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell0)
        return cell0!
        */
        if indexPath.row == 3 {
            let cell1 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell1)
            return cell1!
        } else {
            let cell0 = tableView.dequeueReusableCellWithIdentifier(BaseCell.tableCell0) as? Page1ProductDetailCell2ReviewCell0TableViewCell
            let dummyImageURL = NSURL(string: dummyImage("40x40"))
            cell0?.imageViewProfile.setImageWithURL(dummyImageURL!)
            return cell0!
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
